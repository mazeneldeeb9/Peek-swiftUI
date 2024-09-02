//
//  Movie.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import Foundation

struct Movie: Codable, Identifiable {
    
    let title: String?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    var budget: Int?
    var runtime: Int?
    var genres: [Genre]?
    
    init(favoriteMovie: FavoriteMovie) {
            self.title = favoriteMovie.title
            self.backdropPath = nil
            self.genreIds = []
            self.id = Int(favoriteMovie.id)
            self.originalLanguage = nil
            self.originalTitle = nil
            self.overview = nil
            self.popularity = nil
            self.posterPath = favoriteMovie.posterPath
            self.releaseDate = nil
            self.video = nil
        self.voteAverage = favoriteMovie.voteAverage
            self.voteCount = Int(favoriteMovie.voteCount)
            self.budget = nil
            self.runtime = nil
            self.genres = nil
        }
    
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
    
    
    func getDuration() -> String {
        guard let runtime = self.runtime else { return "N/A" }
        let hours = runtime / 60
        let mins = runtime % 60
        if hours == 0 {
            return "\(mins)m"
        }
        if mins == 0 {
            return "\(hours)h"
        }
        return "\(hours)h \(mins)m"
    }
    
    func getReleaseYear() -> String {
        guard let releaseDate = self.releaseDate else { return "N/A" }
        return String(releaseDate.prefix(4))
    }
    func getVoteAverage() -> String {
        guard let voteAverage = self.voteAverage else { return "N/A" }
        return String(format: "%.1f", voteAverage)
    }
    
    func getGenres() -> (firstCategory: String, secondCategory: String) {
        let firstGenre = genres?.first?.name ?? "Unknown"
        let secondGenre = genres?.dropFirst().first?.name ?? "Unknown"
        return (firstGenre, secondGenre)
    }
    func getVoteCount() -> String {
        guard let voteCount = self.voteCount else {return "N/A"}
        return "(\(voteCount))"
    }
    func formatVoteAverage() -> CGFloat {
        guard let voteAverage = self.voteAverage else {return 0.0}
        return (voteAverage * 2).rounded() / 2
    }
}
