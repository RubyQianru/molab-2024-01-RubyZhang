//
//  Week05App.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI

class AudioDataStore: ObservableObject {
    @Published var audiosSamples: [AudioData] = [
        AudioData("Test 1", "https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3"),
        AudioData("Test 2", "https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3"),
        AudioData("Test 3", "https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3"),
        // Add more AudioData items as needed
    ]
}

@main
struct Week05App: App {
    @StateObject private var audioDataStore = AudioDataStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioDataStore)
        }
    }
}
