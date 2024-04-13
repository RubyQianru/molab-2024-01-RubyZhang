//
//  TwitterFollowersSession.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/5.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class FollowerViewModel: ObservableObject {
    @Published var followerCount: Int = 0
    @Published var coins : [CoinFollower] = []
    
    private var db = Firestore.firestore()
    
    private var coinNames : [(String, String)] = [
        ("DOGE", "dogecoin"),
        ("SHIB", "shiba"),
        ("WIF", "wif"),
        ("PEPE", "pepe"),
        ("FLOKI", "floki"),
        ("BONK", "bonk"),
        ("BOME", "bome"),
        ("CORGIAI", "corgiai"),
        ("BIDEN", "biden"),
        ("BRETT", "brett"),
        ("MEME", "memecoin"),
        ("DEGEN", "degen"),
        ("BABYDOGE", "babydoge"),
        ("MEW", "mew"),
        ("COQ", "coq")
    ]
    
    func fetchAllFolowersCount() {
        self.coins = self.coinNames.map { CoinFollower(id: $0.0, name: $0.1) }
        
        for coin in coins {
            fetchLatestFollowerCount(coinId: coin.name)
        }
        
    }
    
    func fetchLatestFollowerCount(coinId: String) {
        let coinRef = db.collection("MemeCoins").document(coinId)
        coinRef.collection("FollowerCounts")
            .order(by: "timestamp", descending: true)
            .limit(to: 14)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else if let documents = querySnapshot?.documents, documents.count > 0 {
                    var counts: [Int] = []
                    var countsDict: [Int: Int] = [:]
                    var maxi = 0
                    var mini = 39101140
                    for document in documents {
                        if let count = document.data()["count"] as? Int,
                           let timestamp = (document.data()["timestamp"] as? Timestamp)?.seconds {
                            countsDict[Int(timestamp)] = count
                            counts.append(count)
                            if count > maxi {maxi = count}
                            if count < mini {mini = count}
                        }
                    }
                    
                    DispatchQueue.main.async {
                        if let index = self.coins.firstIndex(where: { $0.name == coinId }) {
                            var updatedCoin = self.coins[index]
                            updatedCoin.counts = countsDict
                            updatedCoin.followerCount = counts[0]
                            updatedCoin.firstFollowerCount = counts[13]
                            updatedCoin.maxCount = maxi
                            updatedCoin.minCount = mini
                            let lastFollowerCount = counts.count > 1 ? counts[1] : 0
                            updatedCoin.diff = updatedCoin.followerCount - lastFollowerCount
                            self.coins[index] = updatedCoin
                        }
                    }
                    
                } else {
                    print("No documents found for \(coinId) or count field is missing")
                }
            }
    }}

struct CoinFollower : Identifiable {
    var id: String
    var name: String
    var followerCount: Int = 0
    var firstFollowerCount: Int = 0
    var counts : [Int:Int] = [:]
    var diff: Int = 0
    var maxCount: Int = 0
    var minCount: Int = 0
}

