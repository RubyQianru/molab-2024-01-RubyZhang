//
//  Header.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/3.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer(minLength: 0)
            
            Group {
                Button(action: {}) {
                    Image(systemName: "drop.fill")
                        .foregroundColor(Color.purpleColor)
                        .scaleEffect(1.2)
                }
                Text("12")
            }
            .font(Font.body.weight(.bold))
            .foregroundColor(Color.purpleColor)
        }
        Text(subtitle)
        
    }
}
