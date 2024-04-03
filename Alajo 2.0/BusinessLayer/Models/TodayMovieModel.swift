//
//  TodayMovieModel.swift
//  Alajo
//
//  Created by God's on 3/17/24.
//

import Foundation

// MARK: - TodayMovieModel
struct TodayMovieModel: Codable {
    let page: Int?
    let results: [TodayResult]?
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TodayResult: Codable, MovieCellProtocol {
    var nameTitle: String {
        originalTitle
    }
    
    var dateTitle: String {
        releaseDate
    }
    
    var imgTitle: String {
        "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/\(posterPath)"
    }
    
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title, originalLanguage, originalTitle, overview: String
    let posterPath: String
    let mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

