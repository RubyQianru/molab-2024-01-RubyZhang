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
            Rectangle()
                .frame(height: 0.1)
                .foregroundColor(.gray)
                .padding(.vertical, 1)
            
        }
    }
}

struct InfoViewModel : View {
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

struct LinkTagModel : View {
    let name : String
    var body: some View {
        let urlString = "https://www.coingecko.com/en/coins/\(name.lowercased())"

        let url = URL(string: urlString) {
            Link(destination: url) {
                Text("Twitter")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}
