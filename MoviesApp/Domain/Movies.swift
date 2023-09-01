//
//  Movies.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import Foundation


 struct Movies: Codable {
    var page: Int?
    var results: [Movie]?
    var totalResults: Int?
    var totalPages: Int?
}

 struct Movie: Identifiable, Codable {
    var id: Int?
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?
}

struct MovieDetails: Codable {
    var posterPath: String?
    var overview: String?
    var title: String?
}

