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
        LineGraphView(counts:coin.counts)
        Spacer()
    }
}

struct CoinDetailView: View {
    let coin: CoinFollower

    var body: some View {
        VStack {
            Text(coin.name)
        }
    }
}
