import Foundation
import Combine
import CoreData

extension FavoriteView {
    class Handler: ObservableObject {
        @Published var favoriteUseCase = FavoriteUseCase()
        init() {
            if favoriteUseCase.favoritesMovies.count == 0 {
                favoriteUseCase.loadFavorites()
            }
        }
        
        
    }
}

