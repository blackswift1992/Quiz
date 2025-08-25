//
//  BottomButtonStyle.swift
//  Quiz
//
//  Created by Олексій Мороз on 03.08.2025.
//

import SwiftUI

struct BottomButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var pressedBackgroundColor: Color
    var foregroundColor: Color
    var pressedForegroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(configuration.isPressed ? pressedBackgroundColor : backgroundColor)
            .foregroundStyle(configuration.isPressed ? pressedForegroundColor : foregroundColor)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
