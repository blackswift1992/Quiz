//
//  GreetingView.swift
//  Quiz
//
//  Created by Олексій Мороз on 30.07.2025.
//

import SwiftUI
import ComposableArchitecture

struct GreetingView: View {
    
    @Binding var path: [Route.Greeting]
    
    var body: some View {
        NavigationStack(path: $path) {
            contentView()
                .background {
                    backgroundView()
                }
                .navigationDestination(for: Route.Greeting.self) { Route.Greeting.DesitnationBuilder(path: $path).build(for: $0)
                }
        }
    }
}

//MARK: Private
private extension GreetingView {
    
    func contentView() -> some View {
        VStack(alignment: .leading, spacing: 61) {
            Spacer()
            
            Text("Online Personal\nStyling.\nOutfits for\nEvery Woman.")
                .quizFont(.kaiseiTokuminMedium, size: 32)
                .foregroundStyle(.white)
            
            BottomButtonView(title: "Take a quiz", style: .light) {
                path.append(.whatToFocusOn)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 28)
    }
    
    func backgroundView() -> some View {
        Image("imgGreetingThreeWomen")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .overlay {
                LinearGradient(
                    colors: [.black, .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
            }
    }
}

#Preview {
    @Previewable @State var path: [Route.Greeting] = []
    
    GreetingView(path: $path)
}
