//
//  MoviesRepository.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 05/09/2024.
//

import Foundation
import Combine

class MoviesRepository {
    
    let moviesAPI: MoviesAPI
    private var cancellables = Set<AnyCancellable>()
    
    init(moviesAPI: MoviesAPI = MoviesAPI()) {
        self.moviesAPI = moviesAPI
    }
    
    func fetchCategories(of categoriesToFetch: [(Category, String)], completion: @escaping (Result<[Movies], Error>) -> Void) {
        let publishers = categoriesToFetch.map { category, title in
            moviesAPI.getMovies(for: category)
                .map { response -> Movies in
                    return self.mapToMovies(from: response, categoryTitle: title)
                }
                .eraseToAnyPublisher()
        }
        
        Publishers.MergeMany(publishers)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completionResult in
                switch completionResult {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }, receiveValue: { movies in
                completion(.success(movies))
            })
            .store(in: &cancellables)
    }
    
    private func mapToMovies(from dto: MoviesResponseDTO, categoryTitle: String) -> Movies {
        let movies = dto.results.map { movieDTO in
            movieDTO.toMovie()
        }
        return Movies(title: categoryTitle, results: movies)
    }
}
