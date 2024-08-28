//
//  MovieListCell.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 24/08/2024.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    @State private var isFavorited = false
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text(movie.title ?? "N/A")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        isFavorited.toggle()}) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .foregroundColor(isFavorited ? .red : .gray)
                                .font(.system(size: 24))
                        }
                        .buttonStyle(PlainButtonStyle())
                }.padding([.leading, .trailing], 16)
                    .padding(.top, 8)
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(.lightYellow)
                        .bold()
                    Text(movie.getVoteAverage())
                        .foregroundStyle(.lightYellow)
                        .bold()
                    Spacer()
                    Image(systemName: "clock.fill").foregroundStyle(.gray)
                    Text("1h 56m")
                        .foregroundStyle(.gray)
                    
                }.padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
            }.background(.lightPurple.opacity(0.98))
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 16,
                        bottomTrailingRadius: 16,
                        topTrailingRadius: 0
                    )
                )
        }
        .frame(width: Constants.movieCardWidth, height: Constants.movieCardheight)
        .background(
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath!)")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: Constants.movieCardWidth, height: Constants.movieCardheight)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }  placeholder: {
                VStack {
                    ProgressView()
                    Spacer()
                }
            }
        )
    }
}

