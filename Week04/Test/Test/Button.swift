//
//  Button.swift
//  Test
//
//  Created by qianru zhang on 2024/2/12.
//

import SwiftUI

//Create a circular button:
//https://stackoverflow.com/questions/59639048/how-can-i-make-a-simple-circular-button-in-swiftui-in-macos

struct customButton: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var secondCircleScale : CGFloat = 1.0
    @State private var thirdCircleScale : CGFloat = 1.0
    
    var body: some View {
        Button(action: {
            secondCircleScale *= 1.2
            thirdCircleScale *= 1.5
            })
            {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.primaryColor)
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(Color.primaryColor)
                    .opacity(0.7)
                    .scaleEffect(secondCircleScale)
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.primaryColor)
                    .opacity(0.5)
                    .scaleEffect(thirdCircleScale)

            }
        }
    }
}

#Preview {
    customButton()
}
