//
//  MoviesMappers.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import Foundation


class MovieMapper {

        private func movie(_ movieDTO: MovieDTO) -> Movie {
            return Movie(id: movieDTO.id,poster_path: movieDTO.poster_path, adult: movieDTO.adult, overview: movieDTO.overview, release_date: movieDTO.release_date, genre_ids: movieDTO.genre_ids, original_title: movieDTO.original_title, original_language: movieDTO.original_language, title: movieDTO.title, backdrop_path: movieDTO.backdrop_path, popularity: movieDTO.popularity, vote_count: movieDTO.vote_count, video: movieDTO.video, vote_average: movieDTO.vote_average)
        }
    
        func movies(from moviesDTO: MoviesDTO) -> Movies {
            let results = moviesDTO.results?.compactMap { movie($0)}
            return  Movies(page: moviesDTO.page, results: results, total_results: moviesDTO.total_results, total_pages: moviesDTO.total_pages)
        }
    
    func moviesDetails(from movieDetailsDTO: MovieDetailsDTO) -> MovieDetails {
        return  MovieDetails(poster_path: movieDetailsDTO.poster_path, overview: movieDetailsDTO.overview, title: movieDetailsDTO.title)
    }
    
}
