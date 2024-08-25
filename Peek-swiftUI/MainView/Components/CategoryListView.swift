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
                Text(category.categoryTitle)
                    .bold()
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(category.results, id: \.id) { movie in
                        MovieCard(movie: movie)
                        
                    }
                    .listStyle(.plain)
                }
            }.frame(width: .infinity, height: Constants.movieCardheight, alignment: .leading)
        }.background(.mainPurple)
            .ignoresSafeArea()
    }
    
}



struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        let movieResponse: MoviesResponse = MoviesResponse(categoryTitle: "Now Playing", results: [Movie(title: "Ad Astra", id: 1, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)])
        CategoryListView(category: movieResponse)
    }
}
