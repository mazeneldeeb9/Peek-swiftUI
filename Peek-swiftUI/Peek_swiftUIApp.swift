//
//  Peek_swiftUIApp.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 22/08/2024.
//

import SwiftUI
import CoreData
@main
struct Peek_swiftUIApp: App {
    static let persistenceController = PersistenceController.shared
    @StateObject private var favoritesHandler = FavoritesHandler(context: persistenceController.container.viewContext)

    var body: some Scene {
        WindowGroup {
           MoviesTabBar()
                .environmentObject(favoritesHandler)
        }
    }
}
