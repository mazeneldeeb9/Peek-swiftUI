//
//  View+FavoriteError.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 29/08/2024.
//

import SwiftUI


extension View {
    public func favoriteError(isPresented: Binding<Bool>,
                              message: String) -> some View {
        modifier(
            FavoritesError(isPresented: isPresented, message: message)
        )
    }
}

