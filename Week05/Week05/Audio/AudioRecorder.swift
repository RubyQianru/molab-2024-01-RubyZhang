//
//  AudioRecorder.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//  Folllowing code from Chat-GPT
//

import SwiftUI
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
    private var audioRecorder: AVAudioRecorder?
    @Published var isRecording: Bool = false
    @Published var audioData: [CGFloat] = []
    
    override init() {
        super.init()
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
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        } catch {
            print("Error setting up audio recorder: \(error.localizedDescription)")
        }
    }
    
    func startRecording() {
        audioRecorder?.record()
        isRecording = true
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
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
        
        let power = recorder.averagePower(forChannel: 0)
        print("Decibels: \(power)")

        let normalizedPower = pow(10, (0.05 * power))
        // Normalize the power to a value between 0 and
        
        DispatchQueue.main.async {
            self.audioData.append(CGFloat(normalizedPower))
        }
    }
}

extension AudioRecorder: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            print("Recording finished successfully.")
        } else {
            print("Recording failed.")
        }
    }
}

