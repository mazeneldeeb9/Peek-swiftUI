//
//  FavoriteView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import SwiftUI

struct FavoriteView: View {
    let handler: Handler = .init()
    var body: some View {
        if handler.favoriteUseCase.isLoading {
            LoadingView()
        } else if !handler.favoriteUseCase.isLoaded {
            ErrorView(callAgain: {
                handler.favoriteUseCase.loadFavorites()
            }, errorMessage: handler.favoriteUseCase.errorMessage ?? "Someting went wrong")
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
                
                List(Array(handler.favoriteUseCase.favoritesMovies), id: \.id) {movie in
                    FavoriteCard(movie: movie, favoriteUseCase: handler.favoriteUseCase)
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
