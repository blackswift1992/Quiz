//
//  NavigationBarView.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUI

struct NavigationBarView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var title: String
    private var hideBackButton: Bool
    
    init(title: String, hideBackButton: Bool = false) {
        self.title = title
        self.hideBackButton = hideBackButton
    }
    
    var body: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(hideBackButton ? "" : "icBackButton")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.black)
            }
            Spacer()
            Text(title)
                .textCase(.uppercase)
                .quizFont(.poppinsRegular, size: 14)
                .foregroundStyle(.black)
            Spacer()
            Button("", action: { })
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal)
        .frame(height: 60)
        .background(Color.white)
    }
}

#Preview {
    NavigationBarView(title: "Lifestyle & Interests")
}
