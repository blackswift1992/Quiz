//
//  LoaderView.swift
//  Quiz
//
//  Created by Олексій Мороз on 02.08.2025.
//

import SwiftUI

struct LoaderView: View {
    
    var body: some View {
        ZStack {
            Color.white
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .hex("181819")))
                .scaleEffect(1.5)
        }
    }
}

#Preview {
    LoaderView()
}
