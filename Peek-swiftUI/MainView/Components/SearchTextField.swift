//
//  SearchTextField.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct SearchTextField: View {
    @State var searchText: String = ""

    var body: some View {
        TextField("", text: $searchText, prompt: Text("Search")
            .foregroundColor(.white.opacity(0.8)))
        .padding([.leading, .trailing], 12)
        .frame(height: 55)
        .background(.lightPurple)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .textFieldStyle(.plain)
        .overlay(
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white.opacity(0.8))
                .offset(x: -15)
                .bold(),
            alignment: .trailing
        )
    }
}

#Preview {
    SearchTextField()
}
