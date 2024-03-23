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
    let maxExpectedMarketCap: Double = 18000000000.0
    
    var body: some View {
        VStack{
            HeaderView(title: "Meme Coins", subtitle: "How do your meme coins perform?")
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer()
                HStack(spacing: 50) {
                    ForEach(viewModel.memeCoinData, id: \.self) { coin in
                        var marketCap: Double {
                            if let quotes = coin.quotes {
                                return quotes.USD.marketCap
                            } else {
                                return 0.0
                            }
                        }
                        GeometryReader { geometry in
                            VStack {
                                Rectangle()
                                    .fill(Color.blueColor)
                                    .frame(width: 0, height: geometry.size.height - scaledHeight(for: marketCap, in: geometry.size.height))
                                
                                Image(coin.symbol.uppercased())
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: geometry.size.height)
                                
                            }
                        }
                    }
                    
                }
            }
            .onAppear {
                viewModel.fetchMemeCoinData()
            }
            .padding()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
    
    private func scaledHeight(for marketCap: Double, in maxHeight: CGFloat) -> CGFloat {
        let scalingFactor = marketCap / maxExpectedMarketCap
        return CGFloat(scalingFactor) * maxHeight
    }
    
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
