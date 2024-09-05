//
//  MoviesRepositoryProtocol.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 05/09/2024.
//

import Foundation
import Combine

protocol MoviesRepositoryProtocol {
    func getMovies(for category: Category) -> AnyPublisher<Movies, Error>

}
