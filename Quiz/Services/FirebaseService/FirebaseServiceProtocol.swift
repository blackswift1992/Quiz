//
//  FirebaseServiceProtocol.swift
//  Quiz
//
//  Created by Олексій Мороз on 03.08.2025.
//

protocol FirebaseServiceProtocol {
    
    func loadStylistOffers() async throws -> [StylistOffer]
    func loadStyles() async throws -> [Style]
    func loadColors() async throws -> [FavoriteColor]
}
