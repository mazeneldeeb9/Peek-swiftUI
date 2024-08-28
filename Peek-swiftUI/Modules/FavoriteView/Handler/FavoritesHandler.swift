//
//  FavoritesHandler.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import Foundation
import Combine


class FavoritesHandler: ObservableObject {
    @Published var favoritesMovies: Set<Movie> = []
    private var cancellables = Set<AnyCancellable>()

    
    init() {
        loadFavorites()
        $favoritesMovies
            .sink { [weak self] movies in
                self?.saveFavorites(movies: movies)
            }
            .store(in: &cancellables)
    }
    
    
    func add(_ movie: Movie) {
        favoritesMovies.insert(movie)
    }
    
    func getCount() -> Int {
        return favoritesMovies.count
    }
    
    func remove(_ movie: Movie) {
        favoritesMovies.remove(movie)
    }
    
    func contains(_ movie: Movie) -> Bool {
        return favoritesMovies.contains(movie)
    }
    
    private func saveFavorites(movies: Set<Movie>) {
        if let data = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.set(data, forKey: "favoritesMovies")
        }
    }
    
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "favoritesMovies"),
           let savedMovies = try? JSONDecoder().decode(Set<Movie>.self, from: data) {
            favoritesMovies = savedMovies
        }
    }
}
