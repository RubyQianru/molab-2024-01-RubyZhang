//
//  ConnectView.swift
//  Avala
//
//  Created by qianru zhang on 2024/3/28.
//


import SwiftUI

struct ConnectView: View {
    
    @StateObject private var coinbaseRepo = CoinbaseRepo()
    
    var body: some View {
        VStack {
            Text("Wallet address")
            Text(coinbaseRepo.ethAddress)
            
            Button {
                Task {
                    try await coinbaseRepo.connectToCoinbase()
                }
            } label: {
                
                Text("Connect Wallet")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purpleColor)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ConnectView()
}
