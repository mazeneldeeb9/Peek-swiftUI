//
//  MoviesTabBar.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MoviesTabBar: View {
    @AppStorage("selectedTab") private var selectedTab = 0
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(0)
            FavoriteView()
                .tabItem { Label("Favourite", systemImage: "heart.fill") }
                .tag(1)
        }
        .tint(.brightPurple)
        .onAppear {
            setupColors()
        }
    }
}

#Preview {
    MoviesTabBar()
}
