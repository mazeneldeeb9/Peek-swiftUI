//
//  MoviesUsecase.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 05/09/2024.
//

import Foundation
import Combine

struct MoviesUsecase {
    var repository: MoviesRepository
    
    init(repository: MoviesRepository = MoviesRepository()) {
        self.repository = repository
    }
    
    func fetchCategories(of categoriesToFetch: [(Category, String)]) -> AnyPublisher<[Movies], Error> {
        return Future { promise in
            self.repository.fetchCategories(of: categoriesToFetch) { result in
                switch result {
                case .success(let movies):
                    promise(.success(movies))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchMovieDetails(of movieId: Int) -> AnyPublisher<Movie, NetworkError> {
            return repository.fetchMovieDetails(of: movieId)
                .map { $0.toMovie() }
                .eraseToAnyPublisher()
        }
}


