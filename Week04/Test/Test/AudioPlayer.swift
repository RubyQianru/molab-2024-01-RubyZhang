//
//  AudioPlayer.swift
//  Test
//
//  Created by qianru zhang on 2024/2/20.
//  Based on Audio-State-Demo file AudioDJ
//


import AVFoundation

class AudioPlayer: ObservableObject {
    @Published var player: AVAudioPlayer? = nil

    init() {
        print("Audio player init")
    }
}
