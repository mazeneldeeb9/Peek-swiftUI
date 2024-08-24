//
//  MoviesTabBar.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MoviesTabBar: View {
    @AppStorage("selectedTab") private var selectedTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = .mainPurple
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem { Label("Home", systemImage: "house.fill") }
                .tag(0)
            FavoriteView()
                .tabItem { Label("Favourite", systemImage: "heart.fill") }
                .tag(1)
        }.toolbarBackground(.mainPurple, for: .tabBar)
            .tint(.brightPurple)
        
            .onAppear{           UITabBar.appearance().unselectedItemTintColor =   .inactiveGrey
            }
    }
}

#Preview {
    MoviesTabBar()
}
