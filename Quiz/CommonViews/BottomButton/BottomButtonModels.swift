//
//  BottomButtonModels.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUICore

enum BottomButton {
    
    enum Models {
        
        enum Style {
            case light
            case dark
            
            var foregroundColor: Color {
                switch self {
                case .light:
                    return .hex("181819")
                case .dark:
                    return .white
                }
            }
            
            var backgroundColor: Color {
                switch self {
                case .light:
                    return .white
                case .dark:
                    return .hex("181819")
                }
            }
        }
    }
}
