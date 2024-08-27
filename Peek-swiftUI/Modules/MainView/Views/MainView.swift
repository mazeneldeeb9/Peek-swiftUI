//
//  MainView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MainView: View {
    let moviesResponses: [MoviesResponse] = [
        MoviesResponse(categoryTitle: "Now Playing", results: [  Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 2, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)]),
        MoviesResponse(categoryTitle: "Popular", results: [  Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 2, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)]),
        MoviesResponse(categoryTitle: "Top Rated", results: [  Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 2, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
            Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)]),
]
    var body: some View {
        ZStack {
            Color.mainPurple.ignoresSafeArea()
            VStack(alignment: .leading, content: {
                WelcomeBackTopView()
                SearchTextField()
                List(moviesResponses, id: \.categoryTitle) { moviesResponse in
                    CategoryListView(category: moviesResponse)
                        .padding(.top, 16)
                        
                        .frame(maxWidth: .infinity)
                                .listRowInsets(EdgeInsets())
                                .listRowBackground(Color.clear)
                }.listStyle(.plain)
                    .padding(.trailing, -13)
                
                
                
            }).padding()
        }.removeFocusOnTap()
    }
}

#Preview {
    MainView()
}

