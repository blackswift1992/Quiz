//
//  RealFirebaseService.swift
//  Quiz
//
//  Created by Олексій Мороз on 02.08.2025.
//

import Foundation
import FirebaseDatabase

final class RealFirebaseService: FirebaseServiceProtocol {
    
    private let firebaseDB = Database.database().reference()
    
    func loadStylistOffers() async throws -> [StylistOffer] {
        try await loadAndDecode(path: "stylistOffers", type: [ResponseStylistOffer].self)
            .map { $0.stylistOffer }
            .sorted { $0.id < $1.id }
    }
    
    func loadStyles() async throws -> [Style] {
        try await loadAndDecode(path: "styles", type: [ResponseStyle].self)
            .map { $0.style }
            .sorted { $0.id < $1.id }
    }
    
    func loadColors() async throws -> [FavoriteColor] {
        try await loadAndDecode(path: "colors", type: [ResponseFavoriteColor].self)
            .map { $0.favoriteColor }
            .sorted { $0.id < $1.id }
    }
}

//MARK: Private
private extension RealFirebaseService {
    
    func loadAndDecode<T: Decodable>(path: String, type: T.Type) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            firebaseDB.child(path).observeSingleEvent(of: .value) { snapshot in
                guard let value = snapshot.value else {
                    return continuation.resume(throwing: FirebaseServiceError.noData)
                }
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    continuation.resume(returning: decoded)
                } catch {
                    continuation.resume(throwing: error)
                }
                
            } withCancel: { error in
                continuation.resume(throwing: error)
            }
        }
    }
}
