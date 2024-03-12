//
//  AudioRecorder.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
    
    override init() {
        self.audioData = 0.0
        super.init()
        fetchRecording()
    }
        
    var audioRecorder: AVAudioRecorder!
    
    @Published var recordings = [Recording]()
    @Published var recording = false
    @Published var audioData: CGFloat

    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
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

            recording = true
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.updateAudioVisualization()
            }
            
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        
        fetchRecording()
    }
    
    func fetchRecording() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getFileDate(for: audio))
            recordings.append(recording)
        }
        
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
//        objectWillChange.send(self)
    }
    
    func deleteRecording(urlsToDelete: [URL]) {
            
        for url in urlsToDelete {
            print(url)
            do {
               try FileManager.default.removeItem(at: url)
            } catch {
                print("File could not be deleted!")
            }
        }
        
        fetchRecording()
    }
    
    private func updateAudioVisualization() {
        guard let recorder = audioRecorder else { return }
        if (recording) {
            recorder.updateMeters()
            
            let power = recorder.averagePower(forChannel: 0)
            print("Decibels: \(power)")

//            let normalizedPower = pow(10, (0.05 * power))
            
            DispatchQueue.main.async {
                self.audioData = CGFloat(-power)
            }
        }
        
    }
}
