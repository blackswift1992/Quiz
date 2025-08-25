//
//  QuizApp.swift
//  Quiz
//
//  Created by Олексій Мороз on 30.07.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct QuizApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var path: [Route.Greeting] = []
    
    var body: some Scene {
        WindowGroup {
            GreetingView(path: $path)
        }
    }
}
