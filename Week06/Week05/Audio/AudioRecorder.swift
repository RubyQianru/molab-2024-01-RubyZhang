//
//  AudioRecorder.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI
import AVFoundation
import Combine


class AudioRecorder: NSObject, ObservableObject {
    private var audioRecorder: AVAudioRecorder!
    @Published var recordings = [AudioData]()
    @Published var isRecording: Bool = false
    @Published var audioData: [CGFloat] = []
    
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
            
            //            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //                self.updateAudioVisualization()
            //            }
            
            isRecording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        print("Recording ends.")
        audioRecorder?.stop()
        isRecording = false
        
        fetchRecording()

    }
    
    func fetchRecording() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = AudioData(audio.absoluteString, audio,  getFileDate(for: audio))
            recordings.append(recording)
        }
        
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
    }
    
    func updateAudioVisualization() {
        if (isRecording) {
            audioRecorder.updateMeters()
            
            let power = audioRecorder.averagePower(forChannel: 0)
            print("Decibels: \(power)")
            
            let normalizedPower = 1.0 - pow(10, (power/20.0))
            // Normalize the power to a value between 0 and
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


