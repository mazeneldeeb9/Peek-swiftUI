//
//  FavoriteStorgae.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 02/09/2024.
//

import Foundation
import CoreData

class FavoritesDataManager: ObservableObject {
    var favoritesMovies: Set<Movie> = []
    
    private let context: NSManagedObjectContext
    
    init() {
        self.context = PersistenceController.shared.viewContext
    }
    
    func fetchFavorites() throws -> [FavoriteMovie] {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        return try context.fetch(fetchRequest)
    }
    
    private func transform(_ movie: Movie) -> FavoriteMovie {
        let favoriteMovie = FavoriteMovie(context: context)
        favoriteMovie.id = Int64(movie.id)
        favoriteMovie.title = movie.title
        favoriteMovie.posterPath = movie.posterPath
        favoriteMovie.voteCount = Int64(movie.voteCount ?? -1)
        favoriteMovie.voteAverage = movie.voteAverage ?? 0
        return favoriteMovie
    }
    
    func saveFavorite(movie: Movie) throws -> FavoriteMovie {
        let favoriteMovie = transform(movie)
        favoritesMovies.insert(movie)
        try context.save()
        return favoriteMovie
    }
    
    func deleteFavorite(movie: Movie) throws {
        let fetchRequest: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", movie.id)
        let results = try context.fetch(fetchRequest)
        if let favoriteMovie = results.first {
            context.delete(favoriteMovie)
            try context.save()
            favoritesMovies.remove(movie)
        }
    }
}
