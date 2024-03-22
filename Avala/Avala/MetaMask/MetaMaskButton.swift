//
//  MetaMaskButton.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/12.
//
import SwiftUI
struct MetaMaskButton: View {
    var body: some View {
        ZStack{
            Button(action: {
            }) {
                Text("Connect Wallet")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purpleColor)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}
