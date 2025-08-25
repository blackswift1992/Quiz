//
//  QuizFontModifier.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

import SwiftUI

struct QuizFontModifier: ViewModifier {
    
    let quizFont: QuizFont
    let size: CGFloat

    func body(content: Content) -> some View {
        guard let uiQuizFont = UIFont(name: quizFont.rawValue, size: size) else {
            return content.font(Font(UIFont.systemFont(ofSize: size)))
        }
        return content.font(Font(uiQuizFont))
    }
}


public enum QuizFont: String {
    
    case kaiseiTokuminMedium = "KaiseiTokumin-Medium"
    case poppinsLight = "Poppins-Light"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
}

extension View {
    
    func quizFont(_ font: QuizFont, size: CGFloat) -> some View {
        self.modifier(QuizFontModifier(quizFont: font, size: size))
    }
}
