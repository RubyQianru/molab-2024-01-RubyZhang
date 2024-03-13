//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                ContentView()
                    .tag("person.crop.circle")
                
                RecorderView()
                    .tag("plus")
                //
                RecordingsList()
                    .tag("folder")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //confirm ignoresSafeArea
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack {
                ForEach(tabs, id:\.self){image in
                    if image == "plus" {
                        ZStack{
                            Circle()
                                .foregroundColor(Color.greenColor)
                                .frame(width: 80)
                            TabButtonView(image: image, selectedTab: $selectedTab)
                                .scaleEffect(2)
                                .colorMultiply(.black)
                            
                        }
                    } else {
                        TabButtonView(image: image, selectedTab: $selectedTab)
                            .padding(.horizontal, 30)
                            .scaleEffect(1.2)
                    }
                    
                    if image != tabs.last{
                        Spacer(minLength: 0)
                    }
                    
                }
            }
            .padding(.horizontal, 10)
            .background(Color(.black))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


var tabs = ["house",  "plus", "folder"]

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        return CustomTabView()
            .environmentObject(AudioRecorder())
    }
}

