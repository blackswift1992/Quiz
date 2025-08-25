//
//  StylistOfferView.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import SwiftUI

struct StylistOfferView: View, Equatable {
    
    private let name: String
    private let desciption: String
    private let isChecked: Bool
    
    init(name: String, desciption: String, isChecked: Bool) {
        self.name = name
        self.desciption = desciption
        self.isChecked = isChecked
    }
    
    var body: some View {
        VStack(spacing: 0) {
            contentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundView())
        }
    }
}

//MARK: Private
private extension StylistOfferView {
    
    func contentView() -> some View {
        HStack(spacing: 12) {
            VStack(spacing: 1) {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .quizFont(.poppinsMedium, size: 13)
                    .foregroundColor(.hex("181819"))
                    .textCase(.uppercase)
                Text(desciption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .quizFont(.poppinsLight, size: 14)
                    .foregroundColor(.hex("181819"))
            }
            
            Image(isChecked ? "icChecked" : "icUnchecked")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

        }
        .padding(.horizontal, 16)
        .padding(.vertical, 15)
        
    }
    
    func backgroundView() -> some View {
        Color.white
            .border(Color.hex("C3C5C9"), width: 0.5)
    }
}

#Preview {
    let name: String = "Reinvent wardrobe"
    let description: String = "to discover fresh outfit ideas"
    let isChecked: Bool = true
    
    StylistOfferView(name: name, desciption: description, isChecked: isChecked)
        .frame(height: 72)
        .frame(maxWidth: .infinity)
}
