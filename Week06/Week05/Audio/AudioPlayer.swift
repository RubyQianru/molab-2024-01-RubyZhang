//
//  AudioPlayer.swift
//  Test
//
//  Created by qianru zhang on 2024/2/20.
//  Based on Audio-State-Demo file AudioDJ
//


import AVFoundation

class AudioPlayer: ObservableObject {
    @Published var soundIndex = 0
    @Published var soundFile = audioRef[0]
    @Published var player: AVAudioPlayer? = nil

    init() {
        print("Audio player init")
    }
    
    func play() {
        
        player = loadAudio(soundFile!)
        print("Audio player", player as Any)
        // Loop indefinitely
        player?.numberOfLoops = -1
        player?.play()
    }
    
    func stop() {
        player?.stop()
        player = nil
    }
    
    func prev() {
        choose(soundIndex-1)
    }
    
    func next() {
        choose(soundIndex+1)
    }
    
    func choose(_ index:Int) {
        soundIndex = (index) % AudioPlayer.audioRef.count
        soundFile = AudioPlayer.audioRef[soundIndex]
    }
    
    func loadAudio(_ url:URL) -> AVAudioPlayer? {
        return loadUrlAudio(url)
    }
    
    func loadUrlAudio(_ url:URL) -> AVAudioPlayer? {
        do {
            let data = try Data(contentsOf: url)
            return try AVAudioPlayer(data: data)
        } catch {
            print("loadUrlSound error", error)
        }
        return nil
    }
    
    
    static let audioRef = [
        URL(string:"https://www.youraccompanist.com/images/stories/Reference%20Scales_On%20A%20Flat-G%20Sharp.mp3"),
        URL(string:"https://www.youraccompanist.com/images/stories/Reference%20Scales_Pentatonic%20on%20F%20Sharp.mp3"),
        URL(string:"https://www.youraccompanist.com/images/stories/Reference%20Scales_Chromatic%20Scale%20On%20F%20Sharp.mp3"),
    ]
}
