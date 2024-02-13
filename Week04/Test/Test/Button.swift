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

//Timer for animations:
//https://www.hackingwithswift.com/books/ios-swiftui/triggering-events-repeatedly-using-a-timer
//https://chat.openai.com/c/6b6676d6-3bcd-45df-a3a7-a66d0f73bb36

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
    
    //State management for circle animations
    @State private var scaleSecondCircle: CGFloat = 1.0
    @State private var scaleThirdCircle: CGFloat = 1.0
    
    //State mamagememnt for button
    @State private var isPressing = false
    
    //State management for timer
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
                    .scaleEffect(scaleSecondCircle)
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .shadow(radius: 20, x: -20, y: -20)
                    .scaleEffect(scaleThirdCircle)
                Image(systemName: "mic")
                    .imageScale(.large)
            }
        }
        .onReceive(timer) { _ in
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                if timeRemaining % 2 == 0 {
                    self.scaleSecondCircle *= 1.2
                    self.scaleThirdCircle *= 1.3
                } else {
                    self.scaleSecondCircle /= 1.2
                    self.scaleThirdCircle /= 1.3
                }
            }
            timeRemaining -= 1
        }
    }
}

//referred to week04 GitHub file Audio-State Demo
struct timeDisplay: View {
    @Binding var timeRemaining : Int
    var body: some View {
        VStack{
            Text("Time remaining:")
                .font(.system(size: 24))
                .foregroundColor(Color.secondaryColor)
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



