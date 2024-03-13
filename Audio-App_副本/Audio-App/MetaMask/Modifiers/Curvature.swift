//
//  Curvature.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/12.
//

import SwiftUI

struct ButtonCurvature: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color.clear, lineWidth: 1)
            )
    }
}

struct TextCurvature: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.clear, lineWidth: 1)
            )
    }
}
