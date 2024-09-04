//
//  CategoryListView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct CategoryListView: View {
    let category: MoviesResponse
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(category.categoryTitle ?? "Unkown")
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(category.getMovies(), id: \.id) { movie in
                        NavigationLink(destination: MoviesDetailsView(movieId: movie.id),
                                       label: {
                            MovieCard(movie: movie)
                        }
                        )
                    }
                    .listStyle(.plain)
                }
            }
            .frame(height: Constants.movieCardHeight,
                   alignment: .leading)
        }
        .background(.mainPurple)
        .ignoresSafeArea()
        
        
    }
    
}



