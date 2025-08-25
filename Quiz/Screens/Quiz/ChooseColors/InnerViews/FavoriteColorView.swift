//
//  FavoriteColorView.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUI

struct FavoriteColorView: View, Equatable {
    
    private let name: String
    private let hex: String
    private let isChecked: Bool
    
    init(name: String, hex: String, isChecked: Bool) {
        self.name = name
        self.hex = hex
        self.isChecked = isChecked
    }
    
    var body: some View {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    contentView()
                        .frame(width: geo.size.width, height: geo.size.width)
                        .background(backgroundView())
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
}

//MARK: Private
private extension FavoriteColorView {
    
    func contentView() -> some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 8) {
                Color.hex(hex)
                    .frame(width: 32, height: 32)
                Text(name)
                    .frame(height: 20)
                    .frame(maxWidth: .infinity)
                    .quizFont(isChecked ? .poppinsMedium : .poppinsLight, size: 13)
                    .foregroundColor(.hex("181819"))
                    .textCase(.uppercase)
            }
            .padding(.top, 12.5)
            .padding(.bottom, 8)
            
            if isChecked {
                Image("icChecked")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .offset(x: 7.5, y: -6)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }
    
    func backgroundView() -> some View {
        Color.white
            .border(Color.hex("C3C5C9"), width: 0.5)
    }
}

#Preview {
    let name: String = "Boho"
    let hex: String = "35721E"
    let isChecked: Bool = false
    
    FavoriteColorView(name: name, hex: hex, isChecked: isChecked)
        .frame(width: 108.5)
        .frame(maxWidth: .infinity)
}
