//
//  Button.swift
//  Test
//
//  Created by qianru zhang on 2024/2/12.
//

import SwiftUI

//Create a circular button:
//https://stackoverflow.com/questions/59639048/how-can-i-make-a-simple-circular-button-in-swiftui-in-macos

//Shadow and gradient:
//https://www.youtube.com/watch?v=fuTDDeKs_gc

struct buttonDemo: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack{
                recordButton()
            }
        }
    }
}

struct recordButton: View {
    
    @State private var scale: CGFloat = 1.0
    @State private var isPressing = false
    @State private var startTime = 0
    @State private var timeRemaining = 60

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            timeDisplay(timeRemaining: $timeRemaining)
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .opacity(0.7)
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .shadow(radius: 20, x: -20, y: -20)
                Image(systemName: "mic")
                    .imageScale(.large)
            }
        }
        .onReceive(timer) { input in
             print("onReceive timer", input)
        }
    }
}

//referred to week04 GitHub file Audio-State Demo
struct timeDisplay: View {
    @Binding var timeRemaining : Int
    var body: some View {
        VStack{
            Text("\(timeRemaining)")
                .font(.system(size: 48))
                .foregroundColor(Color.secondaryColor)
        }
    }
}
    
#Preview {
    buttonDemo()
}

// Source
// https://github.com/mobilelabclass/mobile-lab-timer-kit



