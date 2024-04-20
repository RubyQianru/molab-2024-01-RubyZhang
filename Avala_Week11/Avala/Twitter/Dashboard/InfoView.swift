//
//  InfoView.swift
//  Avala
//
//  Created by qianru zhang on 2024/4/12.
//

import Foundation
import SwiftUI

struct InfoView: View {
    let coin : CoinFollower
    var body: some View {
        VStack(alignment: .leading) {
            Text("Info")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Divider()
            InfoViewModel(title: "Twitter", name: coin.name)
        }
    }
}

struct InfoViewModel : View {
    let title : String
    let name : String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .fontWeight(.light)
                    .padding(.vertical, 10)
                    .foregroundColor(.gray)
                Spacer()
                LinkTagModel(name: name)
            }
            .padding(.vertical, 1)
            Divider()
        }
    }
}

struct LinkTagModel : View {
    let name : String
    var body: some View {
        
        let urlString = "https://www.coingecko.com/en/coins/\(name.lowercased())"
        let url = URL(string: urlString)
        
        if let url = url {
            Link(destination: url) {
                Text("Twitter")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.greenColor)
                    )
                    .foregroundColor(.black)
            }
        } else {
            EmptyView()
        }
        
        
        
    }
}
