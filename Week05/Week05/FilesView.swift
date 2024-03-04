//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI

struct FilesView: View {
    @EnvironmentObject var audioDataStore: AudioDataStore
    @EnvironmentObject var globalPlayer: AudioPlayer
    
    var body: some View {
        VStack(alignment: .leading){
            HeaderView(title: "Assets", subtitle: "Build your assets today")
            List {
                Section  {
                    ForEach(audioDataStore.audiosSamples.indices, id:\.self) { index in
                        TabListView(file: $audioDataStore.audiosSamples[index])
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.black)

    }
}

struct TabListView: View {
    @EnvironmentObject var audioDataStore: AudioDataStore
    @EnvironmentObject var globalPlayer: AudioPlayer
    @Binding var file: AudioData
    @State private var isPlaying = false
    
    var body: some View {
        Button(action: {}) {
            HStack{
                Button(action:{
                    file.toggleFavorite()
                }) {
                    Image(systemName: file.favorite ? "heart.fill" : "heart")
                        .foregroundColor(Color(.pink) )
                        .font(Font.title2.weight(.bold))
                }
                Text(file.fileName)
                    .foregroundColor(.black)
                Spacer()
                
                Button(action:{
                    if audioDataStore.currentlyPlaying == nil && !isPlaying{
                        globalPlayer.soundFile = file.audioFile
                        globalPlayer.play()
                        audioDataStore.currentlyPlaying = file
                        isPlaying.toggle()
                    } else if audioDataStore.currentlyPlaying != nil && !isPlaying {
                        globalPlayer.stop()
                        globalPlayer.soundFile = file.audioFile
                        globalPlayer.play()
                        audioDataStore.currentlyPlaying = file
                        isPlaying.toggle()
                    } else {
                        globalPlayer.stop()
                        isPlaying.toggle()
                    }
                }
                ) {
                    Image(systemName: audioDataStore.currentlyPlaying?.fileName == file.fileName && isPlaying ? "stop.fill" : "play.fill")
                        .foregroundColor(Color.purpleColor)
                        .font(Font.title2.weight(.bold))
                }
                .frame(height: 35)
                
            }
        }
    }
}



struct FilesView_Previews: PreviewProvider {
    static var previews: some View {
        let audioDataStore = AudioDataStore()
        let globalPlayer = AudioPlayer()
        
        FilesView()
            .environmentObject(audioDataStore)
            .environmentObject(globalPlayer)
    }
}
