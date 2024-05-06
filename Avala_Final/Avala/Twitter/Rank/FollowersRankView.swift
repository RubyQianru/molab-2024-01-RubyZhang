//
//  FollowersRankView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/22.
//

import Foundation
//
//  MemeCoinView.swift
//  Avala
//
//  Created by qianru zhang on 2024/3/13.
//

import SwiftUI

struct FollowersRankView: View {
    @StateObject var followersviewModel = FollowerViewModel()
    
    let maxFollowers: Int = 3000000
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40) {
                    ForEach(followersviewModel.coins, id: \.id) { coin in
                        GeometryReader { geometry in
                            HStack {
                                Rectangle()
                                    .fill(Color.purpleColor)
                                    .frame(width:scaledWidth(for: (coin.followerCount), in: geometry.size.width - 120) , height: 30)
                                Image(coin.id)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                
                            }
                        }
                    }
                    
                }
                
            }
            .onAppear {
                followersviewModel.fetchAllFolowersCount()
            }
            .padding()
            Spacer()
        }
        
    }
    
    
    private func scaledWidth(for follower: Int, in maxWidth: CGFloat) -> CGFloat {
        let scalingFactor = CGFloat(follower) / CGFloat(maxFollowers)
        return scalingFactor * maxWidth
    }
    
}

struct FollowersRankView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersRankView()
    }
}
