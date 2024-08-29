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
    
    func add(_ movie: Movie)  {
        let favoriteMovie = transform(movie)
        do {
            try context.save()
            favoritesMovies.insert(movie)
        } catch {
            context.delete(favoriteMovie)
            
        }
    }
    
    func remove(_ movie: Movie) {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", movie.id)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let favoriteMovie = results.first {
                context.delete(favoriteMovie)
                try context.save()
                favoritesMovies.remove(movie)
            }
        } catch {

        }
    }
    
    func getCount() -> Int {
        return favoritesMovies.count
    }
    
    
    func contains(_ movie: Movie) -> Bool {
        return favoritesMovies.contains(movie)
    }
    
    
    
    private func loadFavorites() {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        
        do {
            let savedMovies = try context.fetch(fetchRequest)
            favoritesMovies = Set(savedMovies.map { Movie(favoriteMovie: $0) })
        } catch {
            print("Failed to load favorite movies: \(error)")
        }
    }
}
