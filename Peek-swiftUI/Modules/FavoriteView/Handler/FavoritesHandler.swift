//
//  FavoritesHandler.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import Foundation
import Combine
import CoreData

class FavoritesHandler: ObservableObject {
    @Published var favoritesMovies: Set<Movie> = []
    @Published var hasError: Bool = false
    @Published var isLoading: Bool = false
    @Published var isLoaded: Bool = false
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        loadFavorites()
    }
    
    
    private func transform(_ movie: Movie) -> FavoriteMovie {
        let favoriteMovie = FavoriteMovie(context: context)
        favoriteMovie.id = Int64(movie.id)
        favoriteMovie.title = movie.title
        favoriteMovie.posterPath = movie.posterPath
        favoriteMovie.voteCount = Int64(movie.voteCount ?? -1)
        return favoriteMovie
    }
    
    private func handleError(_ error: Error) {
        isLoading = false
        hasError = true
        errorMessage = error.localizedDescription
    }
    
    func loadFavorites() {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        defer {
            isLoading = false
        }
        do {
            isLoading = true
            let savedMovies = try context.fetch(fetchRequest)
            favoritesMovies = Set(savedMovies.map { Movie(favoriteMovie: $0) })
            isLoaded = true
        } catch {
            isLoaded = false
            handleError(error)

        }
    }
    
    func add(_ movie: Movie)  {
        let favoriteMovie = transform(movie)
        defer {
            isLoading = false
        }
        do {
            isLoading = true;
            hasError = false;
            try context.save()
            favoritesMovies.insert(movie)
        } catch {
            context.delete(favoriteMovie)
            handleError(error)
        }
    }
    
    func remove(_ movie: Movie) {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", movie.id)
        defer {
            isLoading = false
        }
        do {
            isLoading = true;
            hasError = false;
            let results = try context.fetch(fetchRequest)
            if let favoriteMovie = results.first {
                context.delete(favoriteMovie)
                try context.save()
                favoritesMovies.remove(movie)
            }
        } catch {
            handleError(error)
        }
    }
    
    func getCount() -> Int {
        return favoritesMovies.count
    }
    
    
    func contains(_ movie: Movie) -> Bool {
        return favoritesMovies.contains(movie)
    }
    
    
    
   
}
