//
//  ResponseStylistOffer.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

struct ResponseStylistOffer: Codable {
    
    let id: Int
    let name: String
    let description: String
    
    var stylistOffer: StylistOffer {
        .init(id: id, name: name, description: description, isChecked: false)
    }
}
