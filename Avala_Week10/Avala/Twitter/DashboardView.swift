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
        CoinHeaderView(coin:coin)
        CoinDetailView(coin:coin)
        LineGraphView(counts:coin.counts, maxi: coin.maxCount, mini: coin.minCount)
            .frame(height: 300)
        Spacer()
    }
}

struct CoinDetailView: View {
    let coin: CoinFollower

    var body: some View {
        VStack {
        }
    }
}
