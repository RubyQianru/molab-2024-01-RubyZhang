//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//

import SwiftUI
import CoinbaseWalletSDK

struct CustomTabView: View {
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                ContentView()
                    .tag("house")
                
                FollowersView()
                    .tag("list.bullet")
                
                CoinView()
                    .tag("dollarsign.circle.fill")
                
            }
            
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack {
                ForEach(tabs, id:\.self){image in
                    
                    TabButtonView(image: image, selectedTab: $selectedTab)
                        .scaleEffect(1.2)
                    
                    if image != tabs.last{
                        Spacer(minLength: 0)
                    }
                    
                }
            }
            .padding(.horizontal, 10)
            .background(Color(.black))
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}


var tabs = ["house",  "list.bullet", "dollarsign.circle.fill"]

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        return CustomTabView()
    }
}

