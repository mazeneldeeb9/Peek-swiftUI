//
//  MoviesDetailsView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import SwiftUI

struct MoviesDetailsView: View {
    let movieId: Int
    @StateObject private var handler: Handler
    
    init(movieId: Int) {
        self.movieId = movieId
        _handler = StateObject(wrappedValue: Handler(movieId: movieId))
    }
    var body: some View {
        if handler.isLoading {
            LoadingView()
        } else if handler.hasError, handler.movie == nil {
            ErrorView(callAgain: {handler.fetchMovieDetails(for: movieId)},
                      errorMessage: handler.errorMessage ?? "Something went Wrong")
        } else if let movie = handler.movie {
            VStack(alignment: .leading) {
                MovieTopImage(urlString: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(handler.movie?.title ?? "N/A")
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
                            Text(movie.getVoteCount())
                                .foregroundStyle(.gray)
                        }.padding([.horizontal, .top])
                        HStack {
                            MovieChip(text: movie.getReleaseYear())
                            MovieChip(text: movie.getGenres().firstCategory)
                            MovieChip(text: movie.getGenres().secondCategory)
                            Spacer()
                            Image(systemName: "clock.fill").foregroundStyle(.gray)
                            Text(movie.getDuration())
                                .foregroundStyle(.gray)
                        }.padding(.horizontal)
                        Text("About film")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .bold()
                            .padding()
                        Text(movie.overview ?? "N/A")
                            .font(.body)
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                            .lineSpacing(0)
                        Spacer()
                    }
                    }
                    
                
            }
            .background(.mainPurple)
            .edgesIgnoringSafeArea(.top)
            
        }
        
    }
}


