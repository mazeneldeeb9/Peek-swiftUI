//
//  Movie.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 25/08/2024.
//

import Foundation

struct Movie: Identifiable {
    
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
    
    init(title: String?, backdropPath: String?, genreIds: [Int]?, id: Int, originalLanguage: String?, originalTitle: String?, overview: String?, popularity: Double?, posterPath: String?, releaseDate: String?, video: Bool?, voteAverage: Double?, voteCount: Int?, budget: Int?, runtime: Int?, genres: [Genre]?) {
        self.title = title
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
        self.budget = budget
        self.runtime = runtime
        self.genres = genres
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
        return voteAverage / 2
    }
}
