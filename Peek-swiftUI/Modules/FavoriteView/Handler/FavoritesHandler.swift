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
    private let dataManager: FavoritesDataManager

    init(context: NSManagedObjectContext) {
        self.dataManager = FavoritesDataManager(context: context)
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
            let savedMovies = try dataManager.fetchFavorites()
            favoritesMovies = Set(savedMovies.map { Movie(favoriteMovie: $0) })
            isLoaded = true
        } catch {
            isLoaded = false
            handleError(error)
        }
    }

    func add(_ movie: Movie) {
        defer {
            isLoading = false
        }
        do {
            isLoading = true
            hasError = false
            _ = try dataManager.saveFavorite(movie: movie)
            favoritesMovies.insert(movie)
        } catch {
            handleError(error)
        }
    }

    func remove(_ movie: Movie) {
        defer {
            isLoading = false
        }
        do {
            isLoading = true
            hasError = false
            try dataManager.deleteFavorite(movie: movie)
            favoritesMovies.remove(movie)
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
