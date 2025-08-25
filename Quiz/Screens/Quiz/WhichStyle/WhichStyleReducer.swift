//
//  WhichStyleReducer.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import ComposableArchitecture
import Foundation

struct WhichStyleReducer: Reducer {
    
    @Dependency(\.quizeStorage) var userDefaultsService
    @Dependency(\.firebaseService) private var firebaseService
    
    struct State: Equatable {
        var isLoading: Bool = false
        var styles: [Style] = []
    }

    enum Action: Equatable {
        case loadStyles
        case checkStyle(id: Int)
        case uncheckStyles
        case setStyles([Style])
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadStyles:
            state.isLoading = true
            return .run { send in
                let styles = try await firebaseService.loadStyles()
                await send(.setStyles(checkedStyles(styles)))
            }
        case .setStyles(let styles):
            state.isLoading = false
            state.styles = styles
            return .none
        case let .checkStyle(id):
            userDefaultsService.checkedStyleID = id
            state.styles = checkedStyles(state.styles)
            return .none
        case .uncheckStyles:
            userDefaultsService.checkedStyleID = nil
            state.styles = checkedStyles(state.styles)
            return .none
        }
    }
}

//MARK: Private
private extension WhichStyleReducer {
    
    func checkedStyles(_ styles: [Style]) -> [Style] {
        let checkedStyleID = userDefaultsService.checkedStyleID
        return styles.map { style in
            var mutableStyle = style
            mutableStyle.isChecked = style.id == checkedStyleID
            return mutableStyle
        }
    }
}
