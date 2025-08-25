//
//  QuizeStorage.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

import Foundation

final class QuizeStorage: QuizeStorageProtocol {
    
    @UserDefault(.checkedStylistOffersIDs, defaultValue: [])
    var checkedStylistOffersIDs: [Int]
    
    @OptionalUserDefault(.checkedStyleID)
    var checkedStyleID: Int?
    
    @UserDefault(.checkedColorsIDs, defaultValue: [])
    var checkedColorsIDs: [Int]
}
