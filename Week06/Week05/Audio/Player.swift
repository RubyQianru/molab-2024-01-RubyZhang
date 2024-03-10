//
//  Player.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import Foundation
import SwiftUI

let timer2 = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

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
    @State private var rotationDegrees: Double = 0.0
    var body: some View {
        ZStack{
            Circle()
            Image("spotify")
                .resizable()
                .frame(width: 200, height: 200)
                .mask(
                    Circle()
                        .frame(width: 170, height: 170)
                )
                .rotationEffect(Angle(degrees: rotationDegrees))
                .onReceive(timer2) { _ in
                    withAnimation(Animation.linear(duration: 0.01)) {
                        self.rotationDegrees += isPlaying ? 0.5 : 0
                    }
                }
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

struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}
