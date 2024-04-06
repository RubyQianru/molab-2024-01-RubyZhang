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
        List(followersviewModel.coins, id: \.id) { coin in
            HStack {
                Text(coin.id)
                Spacer()
                Text("\(coin.followerCount)")
            }
        }
        .onAppear {
            followersviewModel.fetchAllFolowersCount()
        }
    }
}

struct FollowersView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersView()
    }
}
