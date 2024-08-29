//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoritesHandler: FavoritesHandler

    var body: some View {
        if favoritesHandler.isLoading {
            LoadingView()
        } else if !favoritesHandler.isLoaded {
            ErrorView(callAgain: {
                favoritesHandler.loadFavorites()
            }, errorMessage: favoritesHandler.errorMessage ?? "Someting went wrong")
        }
            VStack {
                HStack {
                    Text("Favorites")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    Spacer()
                }
                
                List(Array(favoritesHandler.favoritesMovies), id: \.id) {movie in
                    FavoriteCard(movie: movie)
                        .frame(maxWidth: .infinity)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }.listStyle(.plain)
            }
            .padding(.bottom)
            .background(.mainPurple)
            
          
    }
}

#Preview {
    FavoriteView()
}
