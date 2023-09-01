//
//  MoviesMappers.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import Foundation


class MovieMapper {
  
  private func movie(_ movieDTO: MovieDTO) -> Movie {
    return Movie(id: movieDTO.id, posterPath: movieDTO.poster_path, adult: movieDTO.adult, overview: movieDTO.overview, releaseDate: movieDTO.release_date, genreIds: movieDTO.genre_ids, originalTitle: movieDTO.original_title, originalLanguage: movieDTO.original_language, title: movieDTO.title, backdrop_path: movieDTO.backdrop_path, popularity: movieDTO.popularity, voteCount: movieDTO.vote_count, video: movieDTO.video, voteAverage: movieDTO.vote_average)
  }
  
  func movies(from moviesDTO: MoviesDTO) -> Movies {
    let results = moviesDTO.results?.compactMap { movie($0)}
    return  Movies(page: moviesDTO.page, results: results, totalResults: moviesDTO.total_results, totalPages: moviesDTO.total_pages)
  }
  
  func moviesDetails(from movieDetailsDTO: MovieDetailsDTO) -> MovieDetails {
    return  MovieDetails(posterPath: movieDetailsDTO.poster_path, overview: movieDetailsDTO.overview, title: movieDetailsDTO.title)
  }
  
}
