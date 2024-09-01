//
//  MoviesTabBar+ColorSetup.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

extension MoviesTabBar {
    func setupColors() {
        UITabBar.appearance().barTintColor = .mainPurple
        UITabBar.appearance().backgroundColor = .mainPurple
        UITabBar.appearance().unselectedItemTintColor = .inactiveGrey
    }
}
