//
//  Color+Extensions.swift
//  Quiz
//
//  Created by Олексій Мороз on 31.07.2025.
//

import SwiftUICore

extension Color {
    
    static func hex(_ hexString: String, alpha: Double = 1.0) -> Color {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.removeFirst()
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)

        return Color(
            .sRGB,
            red: Double((rgbValue >> 16) & 0xFF) / 255.0,
            green: Double((rgbValue >> 8) & 0xFF) / 255.0,
            blue: Double(rgbValue & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
