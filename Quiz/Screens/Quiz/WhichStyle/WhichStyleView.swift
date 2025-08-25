//
//  WhichStyleView.swift
//  Quiz
//
//  Created by Олексій Мороз on 31.07.2025.
//

import SwiftUI
import ComposableArchitecture

struct WhichStyleView: View {
    
    @Binding var path: [Route.Greeting]
    let store: StoreOf<WhichStyleReducer>

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Style preferences")
            
            contentView()
                .background(backgroundView())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
        .onAppear() {
            store.send(.loadStyles)
        }
    }
}

//MARK: Private
private extension WhichStyleView {
    
    func contentView() -> some View {
        VStack(spacing: 0) {
            headerView()

            stylesCollectionView()
            
            footerView()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    
    func headerView() -> some View {
        Text("Which style best represents you?")
            .quizFont(.kaiseiTokuminMedium, size: 26)
            .foregroundColor(.hex("181819"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func stylesCollectionView() -> some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.isLoading {
                LoaderView()
                    .padding(.vertical, 16)
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ],
                        spacing: 12
                    ) {
                        ForEach(viewStore.styles) { style in
                            Button {
                                if style.isChecked {
                                    viewStore.send(.uncheckStyles)
                                } else {
                                    viewStore.send(.checkStyle(id: style.id))
                                }
                            } label: {
                                StyleView(name: style.name, isChecked: style.isChecked)
                                    .equatable()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .padding(.horizontal, -10)
        .padding(.top, 24)
    }
    
    func footerView() -> some View {
        BottomButtonView(title: "Continue") {
            path.append(.chooseColors)
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
        WhichStyleView(
            path: $path,
            store: Store(
                initialState: WhichStyleReducer.State(),
                reducer: {
                    WhichStyleReducer()
                        .dependency(\.firebaseService, MockFirebaseService())
                }
            )
        )
    }
}
