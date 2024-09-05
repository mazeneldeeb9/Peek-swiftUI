//
//  FavoritesError.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 29/08/2024.
//

import SwiftUI

struct FavoritesError: ViewModifier {
    @Binding var isPresented: Bool
    let message: String?

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                Alert(
                    title: Text("Something went wrong"),
                    message: message.map { Text($0) },
                    dismissButton: .default(Text("Ok")) {
                        isPresented.toggle()
                    }
                )
            }
    }
}
