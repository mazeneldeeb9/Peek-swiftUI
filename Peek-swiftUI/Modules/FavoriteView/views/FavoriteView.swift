//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var userFavorites: UserFavorites
    
    var body: some View {
        if userFavorites.isLoading {
            LoadingView()
        } else if !userFavorites.isLoaded {
            ErrorView(callAgain: {
                userFavorites.loadFavorites()
            }, errorMessage: userFavorites.errorMessage ?? "Someting went wrong")
        } else {
            VStack {
                HStack {
                    Text("Favorites")
                        .bold()
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                    Spacer()
                }
                
                List(Array(userFavorites.favoritesMovies), id: \.id) {movie in
                    FavoriteCard(movie: movie)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }.listStyle(.plain)
            }
            .padding(.bottom)
            .background(.mainPurple)
        }
        
        
    }
}

#Preview {
    FavoriteView()
}
