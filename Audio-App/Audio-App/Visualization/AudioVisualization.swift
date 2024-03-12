//
//  AudioVisualization.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

import SwiftUI

struct AudioVisualization: View {
    @EnvironmentObject var audioRecorder : AudioRecorder
    var test : CGFloat = 160.0
    var body: some View {
        ZStack {
            Circle()
                .frame(width : test*2, height: test*2)
                .foregroundColor(.blue)
                .blur(radius: 50.0)
                .opacity(0.7)
            Circle()
                .frame(width : test*2, height: test*2)
                .foregroundColor(Color.purpleColor)
                .blur(radius: 50.0)
                .opacity(0.5)


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
                                        
