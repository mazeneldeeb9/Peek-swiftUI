//
//  MainView+Handler.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import Foundation
import Combine

extension MainView {
    @MainActor
    class Handler: ObservableObject {
        @Published var categories: [MoviesResponse] = []
        @Published var isLoading: Bool = false
        @Published var hasError: Bool = false
        @Published var errorMessage: String?
        @Published var favoriteUseCase = FavoriteUseCase()
        private let moviesAPI: MoviesAPI = MoviesAPI()
        private var storage: Set<AnyCancellable> = []
        private var favoritesMovies: Set<Movie> = []
        
        
        init() {
            if favoriteUseCase.favoritesMovies.count == 0 {
                favoriteUseCase.loadFavorites()
            }
            fetchCategories()
        }
        
        private func handleError(_ error: Error) {
            isLoading = false
            hasError = true
            errorMessage = error.localizedDescription
        }
        
        func fetchCategories() {
            isLoading = true
            hasError = false
            let categoriesToFetch: [(Category, String)] = [
                (.nowPlaying, "Now Playing"),
                (.popular, "Popular"),
                (.topRated, "Top Rated"),
            ]
            let publishers = categoriesToFetch.map { category, title in
                moviesAPI.getMovies(for: category)
                    .map { response -> MoviesResponse in
                        var updatedResponse = response
                        updatedResponse.categoryTitle = title
                        return updatedResponse
                    }
                    .eraseToAnyPublisher()
            }
            
            Publishers.MergeMany(publishers)
                .collect()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.errorMessage = error.localizedDescription
                    case .finished:
                        break
                    }
                } receiveValue: { [weak self] responses in
                    self?.categories = responses
                }
                .store(in: &storage)
        }
        

     
    }
    
    
    
}

