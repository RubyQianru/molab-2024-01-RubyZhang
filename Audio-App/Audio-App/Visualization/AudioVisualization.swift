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
                .frame(width : audioRecorder.audioData)
        }
    }
}

struct AudioVisualization_Previews:
    PreviewProvider {
    static var previews: some View {
        let audioRecorder = AudioRecorder()
        AudioVisualization().environmentObject(audioRecorder)
    }
}
                                        
