//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    let movies: [Movie] = [Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
                           Movie(title: "Ad Astra", id: 2, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
                           Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)]
    var body: some View {
            VStack {
                HStack {
                    Text("Favorites")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    Spacer()
                }
                
                List(movies, id: \.id) {movie in
                    FavoriteCard(movie: movie)
                        .frame(maxWidth: .infinity)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }.listStyle(.plain)
            }.background(.mainPurple)
          
    }
}

#Preview {
    FavoriteView()
}
