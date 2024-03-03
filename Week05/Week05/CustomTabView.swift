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
                
                FilesView()
                    .tag("folder")
                
                RecordView()
                    .tag("plus")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //confirm ignoresSafeArea
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack {
                ForEach(tabs, id:\.self){image in
                    if image == "plus" {
                        TabButtonView(image: image, selectedTab: $selectedTab)
                            .scaleEffect(2)
                    } else {
                        TabButtonView(image: image, selectedTab: $selectedTab)
                    }
                    
                    if image != tabs.last{
                        Spacer(minLength: 0)
                    }
                    
                }
            }
            .padding(.horizontal, 10)
            .background(Color("black"))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


var tabs = ["house",  "plus", "folder"]

struct BottomTabBarView_Previews: PreviewProvider {

    static var previews: some View {
        let audioDataStore = AudioDataStore()

        return CustomTabView()
            .environmentObject(audioDataStore)
    }
}

