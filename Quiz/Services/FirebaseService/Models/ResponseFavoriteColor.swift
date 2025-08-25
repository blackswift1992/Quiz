//
//  ResponseFavoriteColor.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

struct ResponseFavoriteColor: Codable {
    
    let id: Int
    let name: String
    let hex: String
    
    var favoriteColor: FavoriteColor {
        .init(id: id, name: name, hex: hex, isChecked: false)
    }
}
