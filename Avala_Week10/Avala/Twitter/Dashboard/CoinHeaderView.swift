//
//  CoinHeaderView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/11.
//

import Foundation
import SwiftUI

struct CoinHeaderView : View {
    let coin: CoinFollower
    var body: some View {
        HStack {
            HStack{
                Image(coin.id)
                    .resizable()
                    .frame(width: 35, height: 35)
                Text(coin.name.capitalized)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(coin.id)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
        }
        .padding()
    }
}
