//
//  Audio_AppApp.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

import SwiftUI

@main
struct AvalaApp: App {
    @StateObject var audioRecorder = AudioRecorder()

    var body: some Scene {
        WindowGroup {
            CustomTabView()
                .environmentObject(audioRecorder)

        }
    }
}
