//
//  ChooseColorsReducer.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import ComposableArchitecture
import Foundation

struct ChooseColorsReducer: Reducer {
    
    @Dependency(\.quizeStorage) var userDefaultsService
    @Dependency(\.firebaseService) private var firebaseService
    
    struct State: Equatable {
        var isLoading: Bool = false
        var colors: [FavoriteColor] = []
    }

    enum Action: Equatable {
        case loadColors
        case checkColor(id: Int)
        case uncheckColor(id: Int)
        case setColors([FavoriteColor])
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadColors:
            state.isLoading = true
            return .run { send in
                let colors = try await firebaseService.loadColors()
                await send(.setColors(checkedColors(colors)))
            }
        case .setColors(let colors):
            state.isLoading = false
            state.colors = colors
            return .none
        case let .checkColor(id):
            addCheckedColorIdInUD(id)
            state.colors = checkedColors(state.colors)
            return .none
        case let .uncheckColor(id):
            removeCheckedColorIdFromUD(id)
            state.colors = checkedColors(state.colors)
            return .none
        }
    }
}

//MARK: Private
private extension ChooseColorsReducer {
    
    func checkedColors(_ colors: [FavoriteColor]) -> [FavoriteColor] {
        let checkedColorsIDs = userDefaultsService.checkedColorsIDs
        let checkedColors = colors.map { color in
            var mutableColor = color
            mutableColor.isChecked = checkedColorsIDs.contains(color.id)
            return mutableColor
        }
        return checkedColors
    }
    
    func addCheckedColorIdInUD(_ id: Int) {
        var idsSet = Set(userDefaultsService.checkedColorsIDs)
        idsSet.insert(id)
        userDefaultsService.checkedColorsIDs = Array(idsSet)
    }
    
    func removeCheckedColorIdFromUD(_ id: Int) {
        userDefaultsService.checkedColorsIDs.removeAll(where: { $0 == id })
    }
}
