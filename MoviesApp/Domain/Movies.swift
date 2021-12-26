//
//  Movies.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import Foundation


 struct Movies : Codable {

    var page : Int?
    var results : [Movie]?
    var total_results : Int?
    var total_pages : Int?
}

 struct Movie : Identifiable,Codable {
    var id : Int?
    var poster_path : String?
    var adult : Bool?
    var overview : String?
    var release_date : String?
    var genre_ids : [Int]?
    var original_title : String?
    var original_language : String?
    var title : String?
    var backdrop_path : String?
    var popularity : Double?
    var vote_count : Int?
    var video : Bool?
    var vote_average : Double?
}

struct MovieDetails : Codable {
   
    var poster_path : String?
    var overview : String?
    var title : String?
}

