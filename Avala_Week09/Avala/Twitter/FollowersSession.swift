//
//  TwitterFollowersSession.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/5.
//

import Foundation
import Firebase
import FirebaseFirestore

class FollowersViewModel : ObservableObject {
    @Published var items = [CoinTwitter]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("yourCollectionName").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.items = documents.map { queryDocumentSnapshot -> CoinTwitter in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let followers_count = data["field"] as? Int ?? 0
                return CoinTwitter(coin: id, followers_count: followers_count)
            }
        }
    }
}




struct CoinTwitter: Codable, Hashable {
    var coin: String
    var followers_count: Int
}
