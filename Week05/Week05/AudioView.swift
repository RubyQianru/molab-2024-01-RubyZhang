//
//  AudioView.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI

struct AudioView: View{
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            //confirm ignoresSafeArea
            .ignoresSafeArea(.all, edges: .bottom)
            
            TabBar()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct Audio_Previews: PreviewProvider {
    static var previews: some View {
        AudioView()
    }
}
