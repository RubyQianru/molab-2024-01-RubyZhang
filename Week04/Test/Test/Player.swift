//
//  Player.swift
//  Test
//
//  Created by qianru zhang on 2024/2/13.
//

import SwiftUI

struct Player : View {
    var body: some View {
        VStack{
            playTab()
        }
    }
}

//Padding:
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-control-spacing-around-individual-views-using-padding

struct playTab : View {
    var body: some View {
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "backward.fill")
                    .imageScale(.large)
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "play.fill")
                    .imageScale(.large)
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "forward.fill")
                    .imageScale(.large)
            })
        }
        .padding(50)
    }
}

#Preview {
    Player()
}
