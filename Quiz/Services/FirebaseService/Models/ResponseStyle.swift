//
//  ResponseStyle.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

struct ResponseStyle: Codable {
    
    let id: Int
    let name: String
    
    var style: Style {
        .init(id: id, name: name, isChecked: false)
    }
}
