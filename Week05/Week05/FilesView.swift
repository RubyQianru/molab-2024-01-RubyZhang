//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI

struct FilesView: View {
    @EnvironmentObject var audioDataStore: AudioDataStore

    var body: some View {
        List {
            Section  {
                ForEach(audioDataStore.audiosSamples.indices, id:\.self) { index in
                    TabListView(file: $audioDataStore.audiosSamples[index])
                    }
                }
            }
        }
    }

struct TabListView: View {
    @EnvironmentObject var audioDataStore: AudioDataStore
    @State private var isPlaying = false

    @Binding var file: AudioData
    @StateObject var audioPlayer = AudioPlayer()

    var body: some View {
        Button(action: {}) {
            HStack{
                Button(action:{
                    file.toggleFavorite()
                }) {
                    Image(systemName: file.favorite ? "heart.fill" : "heart")
                        .foregroundColor(Color("purple") )
                        .font(Font.title2.weight(.bold))
                }
                Text(file.fileName)
                    .foregroundColor(.black)
                Spacer()
                Button(action:{
                    if !isPlaying {
                        audioPlayer.playTrack(file.audioFile)
                    } else {
                        audioPlayer.stop()
                    }
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "stop.fill" : "play.fill")
                        .foregroundColor(Color("purple") )
                        .font(Font.title2.weight(.bold))
                }
                
            }
        }
    }
}



struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        let audioDataStore = AudioDataStore()

        FilesView()
            .environmentObject(audioDataStore)
    }
}
