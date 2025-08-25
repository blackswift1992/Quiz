//
//  WhatToFocusOnView.swift
//  Quiz
//
//  Created by Олексій Мороз on 31.07.2025.
//

import SwiftUI
import ComposableArchitecture

struct WhatToFocusOnView: View {
    
    @Binding var path: [Route.Greeting]
    let store: StoreOf<WhatToFocusOnReducer>

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Lifestyle & Interests", hideBackButton: true)
            
            contentView()
                .background(backgroundView())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
        .onAppear() {
            store.send(.loadOffers)
        }
    }
}

//MARK: Private
private extension WhatToFocusOnView {
    
    func contentView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            headerView()

            offersCollectionView()
            
            footerView()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func headerView() -> some View {
        Text("What’d you like our stylists to focus on?")
            .quizFont(.kaiseiTokuminMedium, size: 26)
            .foregroundColor(.hex("181819"))

        Text("We offer services via live-chat mode.")
            .quizFont(.poppinsLight, size: 14)
            .foregroundColor(.hex("181819"))
    }
    
    func offersCollectionView() -> some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.isLoading {
                LoaderView()
                    .padding(.vertical, 16)
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(viewStore.offers) { offer in
                            Button {
                                if offer.isChecked {
                                    viewStore.send(.uncheckOffer(id: offer.id))
                                } else {
                                    viewStore.send(.checkOffer(id: offer.id))
                                }
                            } label: {
                                StylistOfferView(name: offer.name, desciption: offer.description, isChecked: offer.isChecked)
                                    .equatable()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.horizontal, -10)
            }
        }
        .padding(.top, 24)
    }
    
    func footerView() -> some View {
        BottomButtonView(title: "Continue") {
            path.append(.whichStyle)
        }
        .padding(.bottom, 1)
    }
    
    func backgroundView() -> some View {
        Color.white
            .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @State var path: [Route.Greeting] = []

    NavigationStack {
        WhatToFocusOnView(
            path: $path,
            store: Store(
                initialState: WhatToFocusOnReducer.State(),
                reducer: {
                    WhatToFocusOnReducer()
                        .dependency(\.firebaseService, MockFirebaseService())
                }
            )
        )
    }
}
