//
//  Player.swift
//  Test
//
//  Created by qianru zhang on 2024/2/13.
//  References:
//  Padding and spacing:
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-control-spacing-around-individual-views-using-padding
//  Image masking:
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-mask-one-view-with-another

import SwiftUI

struct Player : View {
    @State private var isPlaying = false
    var body: some View {
        VStack{
            animate(isPlaying: $isPlaying)
            playTab(isPlaying: $isPlaying)
        }
    }
}

struct animate : View {
    @Binding var isPlaying : Bool
    var body: some View {
        ZStack{
            Image("spotify.png")
                .resizable()
                .frame(width: 300, height: 300)
                .mask(
                    Circle()
                )
//            Circle()
        }
        .padding(50)
    }
}

struct playTab : View {
    @StateObject var audioPlayer = AudioPlayer()
    @Binding var isPlaying : Bool
    
    var body: some View {
        HStack{
            Button(action: {
                audioPlayer.prev()
            }, label: {
                Image(systemName: "backward.fill")
                    .imageScale(.large)
            })
            Spacer()
            Button(action:{
                isPlaying ? audioPlayer.stop() : audioPlayer.play()
                isPlaying.toggle()
            }, label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .imageScale(.large)
            })
            Spacer()
            Button(action: {
                audioPlayer.next()
            }, label: {
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
