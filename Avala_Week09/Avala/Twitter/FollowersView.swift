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
                    
                    
                    if coin.diff > 0 {
                        HStack () {
                            Spacer()
                            Image(systemName: "arrowtriangle.up.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.green)
                            Text("\(coin.diff)")
                                .foregroundColor(.green)
                        }
                        .frame(width: 80)
                    } else if coin.diff < 0 {
                        HStack (spacing:0){
                            Spacer()
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.red)
                            Text("\(coin.diff)")
                                .foregroundColor(.red)
                        }
                        .frame(width: 80)
                        
                    } else {
                        HStack(spacing:0){
                            Spacer()
                            Image(systemName: "equal")
                                .resizable()
                                .frame(width: 10, height: 10)
                            Text("\(coin.diff)")
                        }
                        .frame(width: 80)
                        
                    }
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
