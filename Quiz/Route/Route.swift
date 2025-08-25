//
//  Route.swift
//  Quiz
//
//  Created by Олексій Мороз on 31.07.2025.
//

import SwiftUI
import ComposableArchitecture

enum Route {
    
    enum Greeting: Hashable {
        
        case whatToFocusOn
        case whichStyle
        case chooseColors
        
        struct DesitnationBuilder {
            
            @Binding var path: [Route.Greeting]
            
            @ViewBuilder
            func build(for route: Route.Greeting) -> some View {
                switch route {
                case .whatToFocusOn:
                    WhatToFocusOnView(
                        path: $path,
                        store: Store(
                            initialState: WhatToFocusOnReducer.State(),
                            reducer: { WhatToFocusOnReducer() }
                        )
                    )
                case .whichStyle:
                    WhichStyleView(
                        path: $path,
                        store: Store(
                            initialState: WhichStyleReducer.State(),
                            reducer: { WhichStyleReducer() }
                        )
                    )
                case .chooseColors:
                    ChooseColorsView(
                        path: $path,
                        store: Store(
                            initialState: ChooseColorsReducer.State(),
                            reducer: { ChooseColorsReducer() }
                        )
                    )
                }
            }
        }
    }
}
