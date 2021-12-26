//
//  MoviesService.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import Foundation
import Combine


protocol MoviesServiceProtocol {
    func getMoviesList() -> AnyPublisher<Response<Movies>, Error>
    func getMoviesDetails(id : String) -> AnyPublisher<Response<MovieDetails>, Error>
   
}


public class MoviesService: MoviesServiceProtocol {

    private let repository = MoviesRepository()

    
    // ===============
    // MARK: - Services
    // ===============

    func getMoviesList() -> AnyPublisher<Response<Movies>, Error> {
        
        return repository.getMoviesList()
    }
    
    func getMoviesDetails(id : String) -> AnyPublisher<Response<MovieDetails>, Error> {
        return repository.getMoviesDetails(id: id)
    }
}
