//
//  FavoriteUseCase.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 02/09/2024.
//

import Foundation

class FavoriteUseCase: ObservableObject {
    @Published var favoritesMovies: Set<Movie> = []
    @Published var hasError: Bool = false
    @Published var isLoading: Bool = false
    @Published var isLoaded: Bool = false
    @Published var errorMessage: String?
    private let dataManager: FavoritesDataManager = FavoritesDataManager()
    
    init() {
        loadFavorites()
    }
    
    private func handleError(_ error: Error) {
        isLoading = false
        hasError = true
        errorMessage = error.localizedDescription
    }
    func loadFavorites() {
        defer {
            isLoading = false
        }
        do {
            isLoading = true
            hasError = false
            let savedMovies = try dataManager.fetchFavorites()
            favoritesMovies = Set(savedMovies.map { Movie(favoriteMovie: $0) })
            isLoaded = true
        } catch {
            isLoaded = false
            handleError(error)
        }
    }

    func add(_ movie: Movie) {
        do {
            _ = try dataManager.saveFavorite(movie: movie)
            favoritesMovies.insert(movie)
        } catch {
           handleError(error)
        }
    }

    func remove(_ movie: Movie) {
        do {
            try dataManager.deleteFavorite(movie: movie)
            favoritesMovies.remove(movie)
        } catch {
            handleError(error)
        }
    }

    func contains(_ movie: Movie) -> Bool {
        return favoritesMovies.contains(movie)
    }
}
