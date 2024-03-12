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
    var audioUrl: URL
    var favorite : Bool = false
    let createdAt: Date

    init(_ fileName: String,_ audioUrl: URL,_ createdAt: Date) {
        self.id = UUID()
        self.fileName = fileName
        self.audioUrl = audioUrl
        self.createdAt = createdAt
        print("Audio player init")
    }
    
    mutating func toggleFavorite() {
        self.favorite.toggle()
    }
}




