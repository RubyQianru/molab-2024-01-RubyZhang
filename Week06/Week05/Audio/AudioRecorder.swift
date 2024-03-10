//
//  AudioRecorder.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
    private var audioRecorder: AVAudioRecorder!
    @Published var recordings = [AudioData]()
    @Published var isRecording: Bool = false
    @Published var audioData: [CGFloat] = []
    @Published var audioName: String = "default"
    
    override init() {
        super.init()
        fetchRecording()

    }
    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        
        do {
            try recordingSession.setCategory(.record, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY 'at' HH:mm:ss")).m4a")
        
        audioName = "\(Date().toString(dateFormat: "dd-MM-YY 'at' HH:mm:ss"))"
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            print("Recording starts.")
            print("Audio file URL: \(audioFilename)")

            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.updateAudioVisualization()
            }

            isRecording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        print("Recording ends.")
        audioRecorder?.stop()
        isRecording = false
    }
    
    func fetchRecording() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = AudioData(audioName, audio.absoluteString)
            recordings.append(recording)
        }
    }
    
    func updateAudioVisualization() {
        if (isRecording) {
            audioRecorder.updateMeters()
            
            let power = audioRecorder.averagePower(forChannel: 0)
            print("Decibels: \(power)")
            
            let normalizedPower = 1.0 - pow(10, (power/20.0))
            print("Normalized Power: \(normalizedPower)")
            
            DispatchQueue.main.async {
                self.audioData.append(CGFloat(normalizedPower))
            }
        }
    }
}

extension Date
{
    func toString(dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}


