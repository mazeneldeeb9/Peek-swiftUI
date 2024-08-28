//
//  NetworkManager.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import Foundation
import Combine

struct NetworkManager {
    private static let token: String = {
          guard let url = Bundle.main.url(forResource: "config", withExtension: "json"),
                let data = try? Data(contentsOf: url),
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let token = json["token"] as? String else {
              fatalError("Could not load token from config.json")
          }
          return token
      }()
    private let baseUrl: String = "https://api.themoviedb.org/3/movie/"
    private let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(token)"
    ]
    private let timeout: Double = 5
    
    private func makeRequest<T: Decodable>(url: URL, queryItems: [URLQueryItem]) -> AnyPublisher<T, NetworkError> {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        if var existingQueryItems = components.queryItems {
            existingQueryItems.append(contentsOf: queryItems)
            components.queryItems = existingQueryItems
        } else {
            components.queryItems = queryItems
        }
        
        guard let finalURL = components.url else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }

        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = timeout
        request.allHTTPHeaderFields = headers
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.requestFailed(statusCode: (output.response as? HTTPURLResponse)?.statusCode ?? -1)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if let decodingError = error as? DecodingError {
                    return .decodingFailed
                } else if let urlError = error as? URLError {
                    return .requestFailed(statusCode: urlError.code.rawValue)
                } else {
                    return error as? NetworkError ?? .unknown
                }
            }
            .eraseToAnyPublisher()
    }

    func getMovies(for category: Category) -> AnyPublisher<MoviesResponse, NetworkError> {
        guard let url = URL(string: "\(baseUrl)\(category.rawValue)") else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
        ]
        
        return makeRequest(url: url, queryItems: queryItems)
    }

    
    func getMovieDetails(of movieId: Int) -> AnyPublisher<Movie, NetworkError> {
        guard let url = URL(string: "\(baseUrl)\(movieId)") else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }

        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US")
        ]

        return makeRequest(url: url, queryItems: queryItems)
    }
    
}


