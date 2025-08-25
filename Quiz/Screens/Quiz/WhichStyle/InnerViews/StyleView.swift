//
//  StyleView.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUI

struct StyleView: View, Equatable {
    
    private let name: String
    private let isChecked: Bool
    
    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
    
    var body: some View {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    contentView()
                        .frame(width: geo.size.width, height: geo.size.width * 0.95)
                        .background(backgroundView())
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }
}

//MARK: Private
private extension StyleView {
    
    func contentView() -> some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image("img\(name)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                Image(isChecked ? "icChecked" : "icUnchecked")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            
            Text(name)
                .frame(height: 20)
                .frame(maxWidth: .infinity)
                .quizFont(isChecked ? .poppinsMedium : .poppinsLight, size: 13)
                .foregroundColor(.hex("181819"))
                .textCase(.uppercase)
        }
        .padding(8)
    }
    
    func backgroundView() -> some View {
        Color.white
            .border(Color.hex("C3C5C9"), width: 0.5)
    }
}

#Preview {
    let name: String = "Boho"
    let isChecked: Bool = true
    
    StyleView(name: name, isChecked: isChecked)
        .frame(width: 169)
        .frame(maxWidth: .infinity)
}
