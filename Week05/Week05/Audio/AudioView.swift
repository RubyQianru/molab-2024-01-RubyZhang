//
//  AudioView.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI
import AVFoundation

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
var recordButton: UIButton!
var recordingSession: AVAudioSession!
var audioRecorder: AVAudioRecorder!

struct RecordView: View{
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                ButtonDemo()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //confirm ignoresSafeArea
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct ButtonDemo: View {
    
    //State management for timer
    @State private var startTime = 0
    @State private var timeRemaining = 60
    
    @State private var timerIsRunning = false
    
    var body: some View {
        VStack{
            TimeDisplay(
                timerIsRunning: $timerIsRunning,
                timeRemaining: $timeRemaining)
            RecordButton(
                timerIsRunning: $timerIsRunning,
                timeRemaining: $timeRemaining)
        }
    }
}

struct RecordButton: View {
    
    //State mamagememnt for button
    @Binding var timerIsRunning : Bool
    
    //State management for timer
    @Binding var timeRemaining : Int
    
    var body: some View {
        VStack{
            Button(action: {
                self.timerIsRunning.toggle()
                print("Timer triggered!")
                if !self.timerIsRunning {
                    self.timeRemaining = 60
                }
            }){
                Image(systemName: timerIsRunning ? "record.circle" : "record.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.red)
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 && self.timerIsRunning {
                            self.timeRemaining -= 1
                        }
                    }
                    .simultaneousGesture(
                        // Remove the LongPressGesture
                        TapGesture()
                            .onEnded { _ in
                                self.timerIsRunning.toggle()
                                self.timeRemaining = 60
                            }
                    )
                
            }
            
        }
    }
}

//referred to week04 GitHub file Audio-State Demo
struct TimeDisplay: View {
    @Binding var timerIsRunning : Bool
    @Binding var timeRemaining : Int
    var body: some View {
        VStack{
            Text("Time remaining:")
                .font(.system(size: 24))
                .foregroundColor(Color(.black))
            Text("\(timeRemaining)")
                .font(.system(size: 48))
                .foregroundColor(Color(.black))
        }
    }
}


struct Audio_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
