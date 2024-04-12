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
    
    var body: some View {
        NavigationView {
            List(followersviewModel.coins, id: \.id) { coin in
                NavigationLink(destination: CoinDashboardView(coin: coin)) {
                    HStack {
                        Image(coin.id)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(coin.name.capitalized)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        FollowerNumberView(number: coin.followerCount)
                        
                        FollowerChangeView(diff: coin.diff)
                        
                    }
                    .padding(.vertical, 5)
                }
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
