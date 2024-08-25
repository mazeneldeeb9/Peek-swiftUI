//
//  CategoryListView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct CategoryListView: View {
    let movies: [Movie] = [
        Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
        Movie(title: "Ad Astra", id: 2, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
        Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1),
        
    ]
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Now Playing")
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(movies, id: \.id) { movie in
                        MovieCard(movie: movie)
                        
                    }
                    .listStyle(.plain)
                }
            }.frame(height: Constants.movieCardheight)
        }
    }
    
}

#Preview {
    CategoryListView()
}
