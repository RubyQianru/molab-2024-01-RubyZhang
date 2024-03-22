//
//  MemeCoinView.swift
//  Avala
//
//  Created by qianru zhang on 2024/3/13.
//

import Foundation
import SwiftUI

struct CoinView: View {
    @StateObject var viewModel = MemeCoinViewModel()
    
    var body: some View {
        List(viewModel.memeCoinData, id: \.self) { coin in
            HStack {
                // UIImage can render files under resource folder
                
                let imageName = coin.symbol.uppercased()
                Image(imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.headline)
                    Text("Symbol: \(coin.symbol)")
                    Text("Price: \(coin.quotes?.USD.price ?? 0)")
                    Text("Market Cap: \(coin.quotes?.USD.marketCap ?? 0)")
                }
            }
        }
        .onAppear {
            // Trigger the data fetch when the view appears
            viewModel.fetchMemeCoinData()
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
