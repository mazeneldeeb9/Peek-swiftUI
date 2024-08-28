//
//  MainView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MainView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading, content: {
            WelcomeBackTopView(
            message: "Welcome Back,", 
            name: "Mazen")
                .padding(.horizontal)
            SearchTextField(searchText: $searchText)
                .padding(.horizontal)
            List(moviesResponses, id: \.categoryTitle) { moviesResponse in
                CategoryListView(category: moviesResponse)
                    .padding(.top, 16)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
            }.listStyle(.plain)
                .padding(.trailing, -13)
        })
            .background(.mainPurple)
            .removeFocusOnTap()
            
        
    }
}

#Preview {
    MainView()
}

