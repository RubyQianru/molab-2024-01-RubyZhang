//
//  AudioData.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import Foundation
import AVFoundation

struct AudioData: Identifiable, Hashable {
    var id : UUID
    var fileName : String = "Untitled"
    var audioFile: String
    var favorite : Bool = false

    init(_ fileName: String,_ audioFile: String) {
        self.id = UUID()
        self.fileName = fileName
        self.audioFile = audioFile
        print("Audio player init")
    }
    
    mutating func toggleFavorite() {
        self.favorite.toggle()
    }
}




