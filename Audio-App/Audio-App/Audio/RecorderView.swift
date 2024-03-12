//
//  RecorderView.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

//


import SwiftUI

struct RecorderView: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    var body: some View {
        ZStack{
            AudioVisualization()
            VStack {
                HeaderView(title: "Recorder", subtitle: "Record your data today.")
//                RecordingsList(audioRecorder: audioRecorder)
                
                Spacer()
                if audioRecorder.recording == false {
                    Button(action: {self.audioRecorder.startRecording()}) {
                        Image(systemName: "record.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                } else {
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        Image(systemName: "record.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}


struct RecorderView_Previews: PreviewProvider {
    static var previews: some View {
        RecorderView()
            .environmentObject(AudioRecorder())
    }
}

