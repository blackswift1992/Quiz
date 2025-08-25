//
//  QuizeStorageProtocol.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

import Foundation

public protocol QuizeStorageProtocol: AnyObject {
    
    var checkedStylistOffersIDs: [Int] { get set }
    var checkedStyleID: Int? { get set }
    var checkedColorsIDs: [Int] { get set }
}
