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
        } else if handler.hasError {
            ErrorView(callAgain: {handler.fetchMovieDetails(for: movieId)},
                      errorMessage: handler.errorMessage ?? "Something went Wrong")
        } else {
            VStack(alignment: .leading) {
                MovieTopImage(urlString: "https://image.tmdb.org/t/p/w500/\(handler.movie.posterPath ?? "")")
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        HStack {
                            Text(handler.movie.title ?? "N/A")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .bold()
                            Spacer()
                            Image(systemName: "hand.thumbsup.fill")
                                .foregroundStyle(.lightYellow)
                                .bold()
                            Text(handler.movie.getVoteAverage())
                                .foregroundStyle(.lightYellow)
                                .bold()
                            Text(handler.movie.getVoteCount())
                                .foregroundStyle(.gray)
                        }.padding([.horizontal, .top])
                        HStack {
                            MovieChip(text: handler.movie.getReleaseYear())
                            MovieChip(text: handler.movie.getGenres().firstCategory)
                            MovieChip(text: handler.movie.getGenres().secondCategory)
                            Spacer()
                            Image(systemName: "clock.fill").foregroundStyle(.gray)
                            Text(handler.movie.getDuration())
                                .foregroundStyle(.gray)
                        }.padding(.horizontal)
                        Text("About film")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .bold()
                            .padding()
                        Text(handler.movie.overview ?? "N/A")
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


