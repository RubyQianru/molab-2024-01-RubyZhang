//
//  ContentView.swift
//  Test
//
//  Created by qianru zhang on 2024/2/12.
//

import SwiftUI

//https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui

struct ContentView: View {
    @State private var isShowingTestView = false
    @State private var isShowingButtonView = false
    
    var body: some View {
        NavigationView {
                    NavigationStack {
                        NavigationLink(destination: Test(), isActive: $isShowingTestView) {
                            Text("Test")
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primaryColor, lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.primaryColor)
                                        )
                                )
                        }
                        
                        NavigationLink(destination: Button(), isActive: $isShowingButtonView) {
                            Text("Button")
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primaryColor, lineWidth: 2)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.primaryColor)
                                        )
                                )
                        }
                    }
                    .navigationTitle("Week04")
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isShowingTestView = false
                self.isShowingButtonView = false
            }
        }
    }
}

#Preview {
    ContentView()
}
