//
//  DashboardView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/11.
//

import Foundation
import SwiftUI

struct CoinDashboardView: View {
    var coin: CoinFollower
    
    var body: some View {
        ScrollView {
            CoinHeaderView(coin: coin)
            LineGraphView(counts: coin.counts, maxi: coin.maxCount, mini: coin.minCount)
                .frame(height: 300)
            CoinDetailView(coin: coin)
            Spacer()
        }
    }
}

struct CoinDetailView: View {
    let coin: CoinFollower
    
    var body: some View {
        VStack (alignment: .leading) {
            StatisticView(coin: coin)
                .padding()
            InfoView(coin: coin)
                .padding()

        }
    }
}

struct CoinDashboard_Previews: PreviewProvider {
    static var previews: some View {
        CoinDashboardView(coin: CoinFollower(id: "DOGE", name: "Dogecoin", followerCount: 3982517, firstFollowerCount: 3981480, counts: [1712631191: 3981480, 1712717616: 3981960, 1712760804: 3982779, 1712458388: 3989179, 1712588023: 3989323, 1712447567: 3988641, 1712674433: 3983668, 1712933623: 3980843, 1712544787: 3989526, 1712501589: 3989748, 1712436496: 3988078, 1712890412: 3981049, 1712847223: 3982277, 1712803994: 3982517], diff: 240, maxCount: 3990000, minCount: 3981480))
    }
}
