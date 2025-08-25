//
//  BottomButtonView.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUI

struct BottomButtonView: View {
    
    private var title: String
    private var style: BottomButton.Models.Style
    private var action: () -> Void
    
    init(title: String, style: BottomButton.Models.Style = .dark, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .quizFont(.poppinsRegular, size: 14)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
        }
        .buttonStyle(BottomButtonStyle(
            backgroundColor: style.backgroundColor,
            pressedBackgroundColor: style.backgroundColor.opacity(0.7),
            foregroundColor: style.foregroundColor,
            pressedForegroundColor: style.foregroundColor
        ))
    }
}

#Preview {
    BottomButtonView(title: "Lifestyle & Interests", action: { })
}
