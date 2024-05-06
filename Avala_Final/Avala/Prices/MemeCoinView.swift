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

    let maxExpectedMarketCap: Double = 23000000000.0
    
    var body: some View {
        VStack{
            HeaderView(title: "Total Market Cap")
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer()
                HStack(spacing: 65) {
                    ForEach(viewModel.memeCoinData, id: \.self) { coin in var quotes: Quote? {
                            if let quotes = coin.quotes {
                                return quotes
                            } else {
                                return nil
                            }
                        }
                        GeometryReader { geometry in
                            VStack {
                                Rectangle()
                                    .frame(width: 0, height: geometry.size.height - 80 - (viewModel.isDataLoaded ? scaledHeight(for: (quotes?.USD.marketCap)!, in: geometry.size.height) : 0))
                                
                                if let urlString = coin.url, let url = URL(string: urlString) {
                                    Link(destination: url) {
                                        Image(coin.symbol.uppercased())
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                    }
                                } else {
                                    Image(coin.symbol.uppercased())
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                }
                                PriceView(number: quotes!.USD.marketCap)
                                PriceView(number:quotes!.USD.price)
                                    .fontWeight(.bold)

                                Rectangle()
                                    .fill(Color.purpleColor)
                                    .frame(width: 65, height: geometry.size.height)
                                
                            }
                        }
                    }
                    Rectangle()
                        .fill(Color.white.opacity(0.0))
                        .frame(width: 50)
                }
                
            }
            .onAppear {
                viewModel.fetchMemeCoinData()
            }
            .padding()
            Spacer()
        }
        
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
