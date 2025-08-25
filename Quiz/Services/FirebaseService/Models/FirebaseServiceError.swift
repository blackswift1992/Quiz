//
//  FirebaseServiceError.swift
//  Quiz
//
//  Created by Олексій Мороз on 04.08.2025.
//

import Foundation

enum FirebaseServiceError: Error {
    
    case noData
    
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "No data found"
        }
    }
}
