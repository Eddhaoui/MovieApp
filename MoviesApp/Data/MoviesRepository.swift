//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import Foundation
import Combine

struct Response<T> {
  let value: T
  let response: URLResponse
}

enum Action: String {
  case trendingMovies = "discover/movie"
  case movieDetails = "movie/"
}

public class MoviesRepository {
  
  static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
  static let api_key = "c9856d0cb57c3f14bf75bdc6c063b8f3"
  
  func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
    return URLSession.shared
      .dataTaskPublisher(for: request)
      .tryMap { result -> Response<T> in
        
        let value = try JSONDecoder().decode(T.self, from: result.data)
        return Response(value: value, response: result.response)
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  // ******************
  // MARK: - GetMoviesList Request
  // ******************
  
  func getMoviesList() -> AnyPublisher<Response<Movies>, Error> {
    let queryItems = [
      URLQueryItem(name: "api_key", value: MoviesRepository.api_key),
      URLQueryItem(name: "language", value: "en-US"),
      URLQueryItem(name: "sort_by", value: "popularity.desc"),
      URLQueryItem(name: "include_adult", value: "false"),
      URLQueryItem(name: "include_video", value: "false"),
      URLQueryItem(name: "page", value: "1"),
      URLQueryItem(name: "with_watch_monetization_types", value: "flatrate"),
    ]
    guard var components = URLComponents(url: MoviesRepository.baseUrl.appendingPathComponent(Action.trendingMovies.rawValue), resolvingAgainstBaseURL: true)
    else { fatalError("Couldn't create URLComponents") }
    components.queryItems = queryItems
    let request = URLRequest(url: components.url!)
    return self.run(request)
      .tryMap { (moviesDTO: Response<MoviesDTO>) -> Response<Movies> in
        let moviesData = MovieMapper().movies(from : moviesDTO.value )
        return Response(value : moviesData, response: moviesDTO.response)
      }
      .eraseToAnyPublisher()
  }
  
  // ******************
  // MARK: - GetMoviesList Request
  // ******************
  
  func getMoviesDetails(id : String) -> AnyPublisher<Response<MovieDetails>, Error> {
    let queryItems = [
      URLQueryItem(name: "api_key", value: MoviesRepository.api_key),
      URLQueryItem(name: "language", value: "en-US"),
    ]
    guard var components = URLComponents(url: MoviesRepository.baseUrl.appendingPathComponent( Action.movieDetails.rawValue  + id), resolvingAgainstBaseURL: true)
    else { fatalError("Couldn't create URLComponents") }
    components.queryItems = queryItems
    let request = URLRequest(url: components.url!)
    print(request)
    return self.run(request)
      .tryMap { (movieDetailsDTO: Response<MovieDetailsDTO>) -> Response<MovieDetails> in
        let moviesData = MovieMapper().moviesDetails(from : movieDetailsDTO.value )
        return Response(value : moviesData, response: movieDetailsDTO.response)
      }
      .eraseToAnyPublisher()
  }
}
