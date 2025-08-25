//
//  DependencyValues+Extensions.swift
//  Quiz
//
//  Created by Олексій Мороз on 02.08.2025.
//

import Dependencies

//MARK: QuizeStorag
private enum QuizeStorageKey: DependencyKey {
    
    static let liveValue: QuizeStorageProtocol = QuizeStorage()
}

public extension DependencyValues {
    
    var quizeStorage: QuizeStorageProtocol {
        get { self[QuizeStorageKey.self] }
        set { self[QuizeStorageKey.self] = newValue }
    }
}

//MARK: FirebaseService
struct FirebaseServiceKey: DependencyKey {
    
    static let liveValue: FirebaseServiceProtocol = RealFirebaseService()
    static let testValue: FirebaseServiceProtocol = MockFirebaseService()
}

extension DependencyValues {
    
    var firebaseService: FirebaseServiceProtocol {
        get { self[FirebaseServiceKey.self] }
        set { self[FirebaseServiceKey.self] = newValue }
    }
}
