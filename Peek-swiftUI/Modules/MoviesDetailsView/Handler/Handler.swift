//
//  Handler.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 28/08/2024.
//

import SwiftUI
import Combine

extension MoviesDetailsView {
    @MainActor
    class Handler: ObservableObject {
        @Published var movie: Movie! = nil
        @Published var isLoading: Bool = false
        @Published var hasError: Bool = false
        @Published var errorMessage: String?

        private let moviesAPI = MoviesAPI()
        private var storage = Set<AnyCancellable>()

        init(movieId: Int) {
            fetchMovieDetails(for: movieId)
        }

        func fetchMovieDetails(for movieId: Int) {
            isLoading = true
            hasError = false
            moviesAPI.getMovieDetails(of: movieId)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.errorMessage = error.localizedDescription
                        print(error)
                    case .finished:
                        break
                    }
                } receiveValue: { [weak self] movie in
                    self?.movie = movie
                }
                .store(in: &storage)
        }
    }
}

