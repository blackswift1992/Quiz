//
//  MockFirebaseService.swift
//  Quiz
//
//  Created by Олексій Мороз on 03.08.2025.
//

struct MockFirebaseService: FirebaseServiceProtocol {
    
    func loadStylistOffers() async throws -> [StylistOffer] {
        [
            .init(id: 0, name: "Test 0", description: "Description 0", isChecked: false),
            .init(id: 1, name: "Test 1", description: "Description 1", isChecked: false),
            .init(id: 2, name: "Test 2", description: "Description 2", isChecked: false),
            .init(id: 3, name: "Test 3", description: "Description 3", isChecked: false),
            .init(id: 4, name: "Test 4", description: "Description 4", isChecked: false),
            .init(id: 5, name: "Test 5", description: "Description 5", isChecked: false),
            .init(id: 6, name: "Test 6", description: "Description 6", isChecked: false),
            .init(id: 7, name: "Test 7", description: "Description 7", isChecked: false),
            .init(id: 8, name: "Test 8", description: "Description 8", isChecked: false),
            .init(id: 9, name: "Test 9", description: "Description 9", isChecked: false)
        ]
    }
    
    func loadStyles() async throws -> [Style] {
        [
            .init(id: 0, name: "Boho", isChecked: false),
            .init(id: 1, name: "Boho", isChecked: false),
            .init(id: 2, name: "Boho", isChecked: false),
            .init(id: 3, name: "Boho", isChecked: false),
            .init(id: 4, name: "Boho", isChecked: false),
            .init(id: 5, name: "Boho", isChecked: false),
            .init(id: 6, name: "Boho", isChecked: false),
            .init(id: 7, name: "Boho", isChecked: false),
            .init(id: 8, name: "Boho", isChecked: false),
            .init(id: 9, name: "Boho", isChecked: false)
        ]
    }
    
    func loadColors() async throws -> [FavoriteColor] {
        [
            .init(id: 0, name: "Light blue", hex: "ABE2FF", isChecked: false),
            .init(id: 1, name: "Blue", hex: "5EA8FF", isChecked: false),
            .init(id: 2, name: "Indigo", hex: "2237A8", isChecked: false),
            .init(id: 3, name: "Turquoise", hex: "69D1ED", isChecked: false),
            .init(id: 4, name: "Mint", hex: "87DBC8", isChecked: false),
            .init(id: 5, name: "Olive", hex: "A8AD49", isChecked: false),
            .init(id: 6, name: "Green", hex: "29AD3E", isChecked: false),
            .init(id: 7, name: "Emerald", hex: "098052", isChecked: false),
            .init(id: 8, name: "Yellow", hex: "EDDD47", isChecked: false),
            .init(id: 9, name: "Beige", hex: "CA9675", isChecked: false),
            .init(id: 10, name: "Orange", hex: "CD6A09", isChecked: false),
            .init(id: 11, name: "Brown", hex: "7F4B03", isChecked: false),
            .init(id: 12, name: "Pink", hex: "FF86B8", isChecked: false),
            .init(id: 13, name: "Magenta", hex: "CF236E", isChecked: false),
            .init(id: 14, name: "Red", hex: "D31E1E", isChecked: false),
        ]
    }
}
