//
//  AudioRecorder.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//  Folllowing code from Chat-GPT
//

import SwiftUI
import AVFoundation

class AudioRecorder: ObservableObject {
    private var audioRecorder: AVAudioRecorder?
    @Published var isRecording: Bool = false
    @Published var audioData: [CGFloat] = []
    
    init() {
        setupAudioRecorder()
    }
    
    private func setupAudioRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            try audioSession.setActive(true)
            
            let audioSettings: [String: Any] = [
                AVFormatIDKey: kAudioFormatMPEG4AAC,
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFilename = documentPath.appendingPathComponent("recording.m4a")
            
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: audioSettings)
            //            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
    }
    
    func startRecording() {
        audioRecorder?.record()
        isRecording = true
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.updateAudioVisualization()
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
    }
    
    private func updateAudioVisualization() {
        guard let recorder = audioRecorder else { return }
        recorder.updateMeters()
        
        // Get the average power for the left channel (0.0 to -160.0 dB)
        let power = recorder.averagePower(forChannel: 0)
        // Convert the power to a value between 0 and 1
        let normalizedPower = pow(10, (0.05 * power))
        
        print(CGFloat(normalizedPower))
        
        DispatchQueue.main.async {
            self.audioData.append(CGFloat(normalizedPower))
        }
    }
}


