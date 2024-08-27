//
//  MoviesResponse.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import Foundation

struct MoviesResponse: Decodable {
    let categoryTitle: String
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
