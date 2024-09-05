//
//  GenreDTO.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 04/09/2024.
//

import Foundation

struct GenreDTO: Codable {
    let id: Int
    let name: String
    
    
    func toGenre() -> Genre {
        return Genre(id: self.id, name: self.name)
    }
}
