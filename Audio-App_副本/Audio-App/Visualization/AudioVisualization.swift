//
//  AudioVisualization.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

import SwiftUI

struct AudioVisualization: View {
    @EnvironmentObject var audioRecorder : AudioRecorder
    var body: some View {
        ZStack {
            Circle()
                .frame(width : audioRecorder.audioData*2.5, height: audioRecorder.audioData*2)
                .foregroundColor(Color.blueColor)
                .blur(radius: 50.0)
                .opacity(0.7)
                .position(CGPoint(x: 150.0, y: 400.0))
            Circle()
                .frame(width : audioRecorder.audioData*3, height: audioRecorder.audioData*2)
                .foregroundColor(Color.purpleColor)
                .blur(radius: 50.0)
                .opacity(0.5)
                .position(CGPoint(x: 200.0, y: 250.0))
            Circle()
                .frame(width : audioRecorder.audioData*5, height: audioRecorder.audioData*5)
                .foregroundColor(Color.blueColor)
                .blur(radius: 100.0)
                .opacity(0.4)
                .position(CGPoint(x: 250.0, y: 500.0))
            Circle()
                .frame(width : audioRecorder.audioData*1.5, height: audioRecorder.audioData*2)
                .foregroundColor(Color.purpleColor)
                .blur(radius: 100.0)
                .opacity(0.7)
                .position(CGPoint(x: 250.0, y: 600.0))
        }
    }
}

struct Visualization_Previews: PreviewProvider {
    static var previews: some View {
        let audioRecorder = AudioRecorder()
        AudioVisualization()
            .environmentObject(audioRecorder)
    }
}

