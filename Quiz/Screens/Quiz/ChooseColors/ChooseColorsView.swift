//
//  ChooseColorsView.swift
//  Quiz
//
//  Created by Олексій Мороз on 31.07.2025.
//

import SwiftUI
import ComposableArchitecture

struct ChooseColorsView: View {
    
    @Binding var path: [Route.Greeting]
    let store: StoreOf<ChooseColorsReducer>

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "Style preferences")
            
            contentView()
                .background(backgroundView())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarHidden(true)
        .onAppear() {
            store.send(.loadColors)
        }
    }
}

//MARK: Private
private extension ChooseColorsView {
    
    func contentView() -> some View {
        VStack(spacing: 0) {
            headerView()

            colorsCollectionView()
            
            footerView()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
    
    func headerView() -> some View {
        Text("Choose favourite colors")
            .quizFont(.kaiseiTokuminMedium, size: 26)
            .foregroundColor(.hex("181819"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func colorsCollectionView() -> some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.isLoading {
                LoaderView()
                    .padding(.vertical, 16)
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ],
                        spacing: 12
                    ) {
                        ForEach(viewStore.colors) { color in
                            Button {
                                if color.isChecked {
                                    viewStore.send(.uncheckColor(id: color.id))
                                } else {
                                    viewStore.send(.checkColor(id: color.id))
                                }
                            } label: {
                                FavoriteColorView(name: color.name, hex: color.hex, isChecked: color.isChecked)
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
            path.removeAll()
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
        ChooseColorsView(
            path: $path,
            store: Store(
                initialState: ChooseColorsReducer.State(),
                reducer: {
                    ChooseColorsReducer()
                        .dependency(\.firebaseService, MockFirebaseService())
                }
            )
        )
    }
}
