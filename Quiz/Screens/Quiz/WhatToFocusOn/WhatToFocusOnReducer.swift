//
//  WhatToFocusOnReducer.swift
//  Quiz
//
//  Created by Олексій Мороз on 01.08.2025.
//

import ComposableArchitecture
import Foundation

struct WhatToFocusOnReducer: Reducer {
    
    @Dependency(\.quizeStorage) var userDefaultsService
    @Dependency(\.firebaseService) private var firebaseService
    
    struct State: Equatable {
        var isLoading: Bool = false
        var offers: [StylistOffer] = []
    }

    enum Action: Equatable {
        case loadOffers
        case checkOffer(id: Int)
        case uncheckOffer(id: Int)
        case setOffers([StylistOffer])
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadOffers:
            state.isLoading = true
            return .run { send in
                let offers = try await firebaseService.loadStylistOffers()
                await send(.setOffers(checkedOffers(offers)))
            }
        case .setOffers(let offers):
            state.isLoading = false
            state.offers = offers
            return .none
        case let .checkOffer(id):
            addCheckedOfferIdInUD(id)
            state.offers = checkedOffers(state.offers)
            return .none
        case let .uncheckOffer(id):
            removeCheckedOfferIdFromUD(id)
            state.offers = checkedOffers(state.offers)
            return .none
        }
    }
}

//MARK: Private
private extension WhatToFocusOnReducer {
    
    func checkedOffers(_ offers: [StylistOffer]) -> [StylistOffer] {
        let checkedStylistOffersIDs = userDefaultsService.checkedStylistOffersIDs
        let checkedOffers = offers.map { offer in
            var mutableOffer = offer
            mutableOffer.isChecked = checkedStylistOffersIDs.contains(offer.id)
            return mutableOffer
        }
        return checkedOffers
    }
    
    func addCheckedOfferIdInUD(_ id: Int) {
        var idsSet = Set(userDefaultsService.checkedStylistOffersIDs)
        idsSet.insert(id)
        userDefaultsService.checkedStylistOffersIDs = Array(idsSet)
    }
    
    func removeCheckedOfferIdFromUD(_ id: Int) {
        userDefaultsService.checkedStylistOffersIDs.removeAll(where: { $0 == id })
    }
}
