//
//  TwitterFollowersSession.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/5.
//

import Foundation
import Firebase
import FirebaseFirestore

class FollowerViewModel: ObservableObject {
    @Published var followerCount: Int = 0
    
    private var db = Firestore.firestore()
    
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





struct CoinTwitter: Codable, Hashable {
    var coin: String
    var followers_count: Int
}
