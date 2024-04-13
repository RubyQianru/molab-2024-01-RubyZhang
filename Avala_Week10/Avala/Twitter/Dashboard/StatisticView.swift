//
//  StatisticView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/12.
//

import Foundation
import SwiftUI

struct StatisticView : View {
    let coin : CoinFollower
    
    var body: some View {
        
        let totalFollower = coin.followerCount
        let halfdaydiff = coin.diff
        let weekdiff = coin.followerCount - coin.firstFollowerCount
        let maxCount = coin.maxCount
        let minCount = coin.minCount
        
        VStack(alignment: .leading) {
            
            Text("\(coin.name.capitalized) Statistics")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(height: 0.1)
                .foregroundColor(.gray)
                .padding(.vertical, 1)
            
            StatisticViewModel(title: "Twitter Follower", data: totalFollower)
            StatisticViewModel(title: "12-Hour Increase", data: halfdaydiff)
            StatisticViewModel(title: "1-Week Increase ", data: weekdiff)
            StatisticViewModel(title: "Max Followers", data: maxCount)
            StatisticViewModel(title: "Min Followers", data: minCount)
        }
    }
}

struct StatisticViewModel : View {
    let title : String
    let data : Int
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .fontWeight(.light)
                    .padding(.vertical, 10)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(data)")
            }
            .padding(.vertical, 1)
            Rectangle()
                .frame(height: 0.1)
                .foregroundColor(.gray)
                .padding(.vertical, 1)
        }
        
    }
}


