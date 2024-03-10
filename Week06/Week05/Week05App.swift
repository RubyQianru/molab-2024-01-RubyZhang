//
//  Week05App.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI
import AVFoundation

class AudioDataStore: ObservableObject {
    @Published var recordings: [AudioData] = [
        AudioData("Test 1", "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3"),
        AudioData("Test 2", "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3"),
        AudioData("Test 3", "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3"),
        // Add more AudioData items as needed
    ]
    
    @Published var currentlyPlaying: AudioData? = nil
    
}


@main
struct Week05App: App {
    @StateObject private var audioDataStore = AudioDataStore()
    @StateObject private var globalPlayer = AudioPlayer()
    @StateObject private var globalRecorder = AudioRecorder()
    var body: some Scene {
        WindowGroup {
            CustomTabView()
                .environmentObject(audioDataStore)
                .environmentObject(globalPlayer)
                .environmentObject(globalRecorder)
        }
    }
}
