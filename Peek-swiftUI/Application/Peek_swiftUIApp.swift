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
    @StateObject var userFavorites: UserFavorites = UserFavorites()
    var body: some Scene {
        WindowGroup {
           MoviesTabBar()
                .environmentObject(userFavorites)
        }
    }
}
