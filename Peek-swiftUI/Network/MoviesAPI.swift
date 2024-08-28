
import SwiftUI
import Combine
struct MoviesAPI {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getMovies(for category: Category) -> AnyPublisher<MoviesResponse, NetworkError> {
        let queryItems = [URLQueryItem(name: "page", value: "1")]
        return networkManager.makeRequest(urlExtension: category.rawValue, newQueryItems: queryItems)
    }
    
    
    func getMovieDetails(of movieId: Int) -> AnyPublisher<Movie, NetworkError> {
        return networkManager.makeRequest(urlExtension: "\(movieId)")
    }
    
}

