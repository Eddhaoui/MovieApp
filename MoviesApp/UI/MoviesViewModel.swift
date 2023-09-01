//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import Foundation
import Combine
import SwiftUI

public class MoviesViewModel: ObservableObject {
    
    @Published var data: Data?
    @Published var trendingMoviesLoadingState: LoadingState<Response<Movies>, Error> = .loading
    @Published var moviesDeatailsLoadingState: LoadingState<Response<MovieDetails>, Error> = .loading
    @Published var movies: [Movie] = []
    @Published var details = MovieDetails()
    var moviesService: MoviesServiceProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(moviesService : MoviesServiceProtocol) {
        self.moviesService = moviesService
    }
    
    // ===============
    // MARK: - Service
    // ===============
    
    public func getTrendingMovies() {
        
        moviesService.getMoviesList()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                    self.trendingMoviesLoadingState = .error(error)
                }
            } receiveValue: { moviesData in
                self.trendingMoviesLoadingState = .loaded(moviesData)
                self.movies = moviesData.value.results ?? []
            }
            .store(in: &cancellables)
    }
  
    public func getMovieDeatails(id : String) {
        
        moviesService.getMoviesDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                    self.moviesDeatailsLoadingState = .error(error)
                }
            } receiveValue: { moviesData in
                self.moviesDeatailsLoadingState = .loaded(moviesData)
                self.details = moviesData.value
            }
            .store(in: &cancellables)
    }
    
    public enum LoadingState<Payload, Error> {
        case loading
        case loaded(_ payload: Payload)
        case error(_ error: Error)
    }
    
    func loadData(from urlString:String) {
        
        let url = "https://image.tmdb.org/t/p/original/" + urlString
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
}
