//
//  MoviesUsecase.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 05/09/2024.
//

import Foundation
import Combine

struct MoviesUsecase {
    private let moviesAPI: MoviesAPI = MoviesAPI()
    private var cancellables = Set<AnyCancellable>()
    
    mutating func fetchCategories(of categoriesToFetch: [(Category, String)], completion: @escaping (Result<[MoviesResponse], Error>) -> Void) {
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
            .sink(receiveCompletion: { completionResult in
                switch completionResult {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }, receiveValue: { responses in
                completion(.success(responses))
            })
            .store(in: &cancellables)
    }
}
