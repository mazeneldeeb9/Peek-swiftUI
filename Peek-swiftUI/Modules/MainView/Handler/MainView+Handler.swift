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
        private let networkManager: NetworkManager = NetworkManager()
        private var storage: Set<AnyCancellable> = []
        
        
        init() {}
        
        
        func fetchCategories() {
            isLoading = true
            hasError = false
            let categoriesToFetch: [(Category, String)] = [
                (.nowPlaying, "Now Playing"),
                (.popular, "Popular"),
                (.topRated, "Top Rated"),
            ]
            let publishers = categoriesToFetch.map { category, title in
                networkManager.getMovies(for: category)
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

