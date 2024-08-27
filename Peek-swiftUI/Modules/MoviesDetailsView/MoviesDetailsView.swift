//
//  MoviesDetailsView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import SwiftUI

struct MoviesDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            MovieTopImage(urlString: movie.posterPath!)
            HStack {
                Text(movie.title ?? "N/A")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                Spacer()
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundStyle(.lightYellow)
                    .bold()
                Text(movie.getVoteAverage())
                    .foregroundStyle(.lightYellow)
                    .bold()
                Text("(100000)")
                    .foregroundStyle(.gray)
            }.padding([.horizontal, .top])
            HStack {
                MovieChip(text: "2024")
                MovieChip(text: "Action")
                MovieChip(text: "Comedy")
                Spacer()
                Image(systemName: "clock.fill").foregroundStyle(.gray)
                Text("1h 56m")
                    .foregroundStyle(.gray)
            }.padding(.horizontal)
            Text("About film")
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
                .padding()
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fringilla diam in metus lacinia, et tincidunt diam suscipit. Cras ultricies efficitur molestie. Sed cursus tincidunt molestie. Praesent ullamcorper vitae dolor non ullamcorper. Quisque porttitor fringilla nisl in commodo. Vivamus ndrerit ante id lectus.")
                .font(.body)
                .foregroundStyle(.gray)
                .padding(.horizontal)
                .lineSpacing(0)
    
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.mainPurple)
        
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "Ad Astra", id: 3, posterPath: "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg", voteAverage: 6.1)
        
        MoviesDetailsView(movie: movie)
    }
}


