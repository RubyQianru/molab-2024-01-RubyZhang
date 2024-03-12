//
//  FilesView.swift
//  Based on SeaSell App https://github.com/usmanmukhtar/SeaSell-UI/tree/main
//
//  Created by qianru zhang on 2024/3/2.
//
import SwiftUI

struct TabButtonView: View {
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(systemName: image)
                .foregroundColor(selectedTab == image ? Color.greenColor : .white)
                .padding()
                .font(Font.title2.weight(.bold))
        }
    }
}

