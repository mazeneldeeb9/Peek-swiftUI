//
//  Movie.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let title: String?
    let backdropPath: String?
    private let genreIds: [Int]?
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
    private var runtime: Int?
    private var genres: [Genre]?
    
    
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
        return String(releaseDate!.prefix(4))
    }
    func getVoteAverage() -> String {
        return String(format: "%.1f", self.voteAverage!)
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
}
