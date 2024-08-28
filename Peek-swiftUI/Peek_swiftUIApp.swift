//
//  Peek_swiftUIApp.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 22/08/2024.
//

import SwiftUI

@main
struct Peek_swiftUIApp: App {
    @StateObject private var favoritesHandler = FavoritesHandler()
    var body: some Scene {
        WindowGroup {
           MoviesTabBar()
                .environmentObject(favoritesHandler)
        }
    }
}
