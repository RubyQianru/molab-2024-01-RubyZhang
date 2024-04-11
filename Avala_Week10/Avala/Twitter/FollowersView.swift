//
//  FollowersView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/6.
//

import Foundation
import SwiftUI

struct FollowersView: View {
    @StateObject var followersviewModel = FollowerViewModel()
    
    var sortedCoins: [CoinFollower] {
        followersviewModel.coins.sorted { $0.followerCount > $1.followerCount }
    }
    
    var body: some View {
        VStack{
            HeaderView(title: "Twitter Followers", subtitle: "")
            List(sortedCoins, id: \.id) { coin in
                HStack {
                    Image(coin.id)
                        .resizable()
                        .frame(width: 35, height: 35)
                    Text(coin.name.capitalized)
                        
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(coin.followerCount)")
                    FollowerChangeView(diff: coin.diff)
                }
                .padding(.vertical, 5)
            }
            
            .onAppear {
                followersviewModel.fetchAllFolowersCount()
            }
        }
    }
}


struct FollowersView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersView()
    }
}
