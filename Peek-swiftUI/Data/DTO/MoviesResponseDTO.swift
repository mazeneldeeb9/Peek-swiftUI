//
//  MoviesResponseDTO.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 05/09/2024.
//

import Foundation


struct MoviesResponseDTO: Codable {
    var category: Category?
    let page: Int
    let results: [MovieDTO]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
   
    
}
