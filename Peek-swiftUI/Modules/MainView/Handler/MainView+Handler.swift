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
        @Published var categories: [Movies] = []
        @Published var isLoading: Bool = false
        @Published var hasError: Bool = false
        @Published var errorMessage: String?
        var moviesUsecase = MoviesUsecase(repository: MoviesRepository())
        private var cancellables = Set<AnyCancellable>()
        
        init() {
            loadCategories()
        }
        
        private func handleError(_ error: Error) {
            isLoading = false
            hasError = true
            errorMessage = error.localizedDescription
        }
        
        func loadCategories() {
            isLoading = true
            let categoriesToFetch: [(Category, String)] = [
                (.nowPlaying, "Now Playing"),
                (.popular, "Popular"),
                (.topRated, "Top Rated")
                ]
            moviesUsecase.fetchCategories(of: categoriesToFetch)
                .sink(receiveCompletion: { completionResult in
                    switch completionResult {
                    case .failure(let error):
                        self.handleError(error)
                    case .finished:
                        break
                    }
                }, receiveValue: { movies in
                    self.categories = movies
                    self.isLoading = false
                })
                .store(in: &cancellables)
        }
    }
    
}

