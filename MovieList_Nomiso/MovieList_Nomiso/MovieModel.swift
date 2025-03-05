//
//  MovieModel.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//
//Access Token eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NjU5YzAzZDIyOTc1YzkwOTFmNmQ1MTZhOWE1MjYxNiIsIm5iZiI6MTc0MTE4MzQxMS4wMTIsInN1YiI6IjY3Yzg1OWIzOTI2NGFhNTg2NjZlNDJhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UUUK0_2j10W7L_6NwGv3zwcxKuKEhia-YEvTnTuvRRk

//API Key 9659c03d22975c9091f6d516a9a52616
import Foundation

// MARK: - MovieModel
struct MovieModel: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    var id: Int { _id ?? UUID().hashValue } // Provide a fallback ID
    let _id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case _id = "id" 
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var posterURL: URL? {
            guard let path = posterPath else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/w500" + path)
        }
}


struct MovieResponse: Codable {
    let results: [MovieResult]
}
