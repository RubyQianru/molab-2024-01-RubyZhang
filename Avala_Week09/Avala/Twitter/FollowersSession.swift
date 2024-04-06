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
    
    private var coinNames = [ "dogecoin","shiba", "wif", "pepe", "floki", "bonk", "bome", "corgiai","biden","brett","memecoin", "degen", "mew", "babydoge", "coq" ]

    func fetchAllFolowersCount() {
        self.coins = self.coinNames.map{ CoinFollower(id: $0) }

        for i in 0..<coins.count {
            fetchLatestFollowerCount(coinId: coins[i].id)
        }
    }
    
    func fetchLatestFollowerCount(coinId: String) {
        let coinRef = db.collection("MemeCoins").document(coinId)
        coinRef.collection("FollowerCounts")
            .order(by: "timestamp", descending: true)
            .limit(to: 1)
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        if let followerCount = document.data()["count"] as? Int {
                            DispatchQueue.main.async {
                                self.followerCount = followerCount
                            }
                        }
                    }
                }
            }
    }
}

struct CoinFollower {
    var id: String
    var followerCount: Int = 0
}

