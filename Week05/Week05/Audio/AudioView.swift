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
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: "Recorder", subtitle: "Record")
            ButtonDemo()
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .bottom)
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
        .ignoresSafeArea(.all, edges: .bottom)

    }
}

struct Visualization: View {
    var audioData : [CGFloat]
    var body: some View {
        VStack{
            LineGraph(data: audioData, maxData: 1, minValue: 0.00, maxValue: 1.00)
                .clipped()
                .background(Color.accentColor.opacity(0.1))
                .cornerRadius(20)
                .padding()
                .aspectRatio(1, contentMode: .fit)
        }

    }
}

struct RecordButton: View {
    @StateObject private var audioRecorder = AudioRecorder()
    @Binding var timerIsRunning : Bool
    
    //State management for timer
    @Binding var timeRemaining : Int
    
    var body: some View {
        VStack{
            
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
                            
                            if audioRecorder.isRecording {
                                audioRecorder.stopRecording()
                            } else {
                                audioRecorder.startRecording()
                            }
                        }
                )
            Visualization(audioData: audioRecorder.audioData)
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
