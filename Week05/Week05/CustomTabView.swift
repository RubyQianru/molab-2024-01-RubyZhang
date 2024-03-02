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
                    .tag("house")
                FilesView()
                    .tag("filemenu.and.selection")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //confirm ignoresSafeArea
            .ignoresSafeArea(.all, edges: .bottom)
            
            TabBar()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBar: View {
    @State var selectedTab = "house"
    var body: some View {
        HStack {
            ForEach(tabs, id:\.self){image in
                if image == "plus" {
                    TabButtonView(image: image, selectedTab: $selectedTab)
                               .colorMultiply(Color("green"))
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
}

var tabs = ["house", "filemenu.and.selection", "plus", "folder", "person.crop.circle.fill"]

struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
