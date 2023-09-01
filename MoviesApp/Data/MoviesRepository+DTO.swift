//
//  MoviesRepository+DTO.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import Foundation

struct MoviesDTO: Codable {
    var page: Int?
    var results: [MovieDTO]?
    var total_results: Int?
    var total_pages: Int?
}

struct MovieDTO: Codable {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
}

struct MovieDetailsDTO: Codable {
    var poster_path: String?
    var overview: String?
    var title: String?
}
