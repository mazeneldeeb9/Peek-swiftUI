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
        private var moviesUsecase = MoviesUsecase()

        
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
                moviesUsecase.fetchCategories(of: [(Category.popular, "Popular"), (Category.topRated, "Top Rated")]) { [weak self] result in
                    DispatchQueue.main.async {
                        self?.isLoading = false
                        switch result {
                        case .success(let responses):
                            self?.categories = responses
                        case .failure(let error):
                            self?.handleError(error)
                        }
                    }
                }
            }
        

     
    }
    
    
    
}

