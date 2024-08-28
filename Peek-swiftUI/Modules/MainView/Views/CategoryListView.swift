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
                Text(category.categoryTitle ?? "N/A")
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
            }
            .frame(height: Constants.movieCardheight,
                    alignment: .leading)
        }
        .background(.mainPurple)
        .ignoresSafeArea()
    }
    
}




