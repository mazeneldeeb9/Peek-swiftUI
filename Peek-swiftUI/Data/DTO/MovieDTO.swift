//
//  MovieDTO.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 04/09/2024.
//

import Foundation

struct MovieDTO: Codable, Identifiable {
    let id: Int
    let title: String?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let budget: Int?
    let runtime: Int?
    let genres: [GenreDTO]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case budget
        case runtime
        case genres
    }
    
    func toMovie() -> Movie {
        return Movie(
            title: self.title,
            backdropPath: self.backdropPath,
            genreIds: self.genreIds,
            id: self.id,
            originalLanguage: self.originalLanguage,
            originalTitle: self.originalTitle,
            overview: self.overview,
            popularity: self.popularity,
            posterPath: self.posterPath,
            releaseDate: self.releaseDate,
            video: self.video,
            voteAverage: self.voteAverage,
            voteCount: self.voteCount,
            budget: self.budget,
            runtime: self.runtime,
            genres: self.genres?.map { $0.toGenre() }
        )
    }
}
