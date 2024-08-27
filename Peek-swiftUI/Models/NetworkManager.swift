//
//  NetworkManager.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 27/08/2024.
//

import Foundation
import Combine

struct NetworkManager {
    private static let token: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODhjZmIxYzUzMjMzYTczYWY0ZjI0Y2JhMmFiNGU3MiIsIm5iZiI6MTcyMzA0NzA3Ni44ODY1ODIsInN1YiI6IjY2YjM2NTdmOTNlZTc4MTk4YTdiOTA1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.evCPiBsuvwVuRO53d6fAVq0Powd5JVSevI7SkMQrzso"
    private let baseUrl: String = "https://api.themoviedb.org/3/movie/"
    private let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(token)"
    ]
    private let timeout: Double = 5
    
    
    func getMovies(for category: Category) -> AnyPublisher<MoviesResponse, NetworkError> {
        guard let url = URL(string: "\(baseUrl)\(category.rawValue)") else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = URLRequest(url: components.url!)
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
            .decode(type: MoviesResponse.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if error is DecodingError {
                    return NetworkError.decodingFailed
                } else {
                    return error as! NetworkError
                }
            }
            .eraseToAnyPublisher()
    }
}


