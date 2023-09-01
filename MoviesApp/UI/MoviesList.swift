//
//  MoviesList.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import SwiftUI

struct MoviesList: View {
  
  @ObservedObject var moviesViewModel : MoviesViewModel
  
  var body: some View {
    VStack {
      switch moviesViewModel.trendingMoviesLoadingState {
      case .loading :
        ProgressView()
      case .error(_) :
        ProgressView()
      case .loaded(_) :
        NavigationView {
          List {
            ForEach(moviesViewModel.movies, id: \.id) { movie in
              MovieRow(movie: movie)
            }
          }
          .navigationTitle("Trending Movies")
          .listStyle(GroupedListStyle())
        }
      }
    }
    .onAppear {
      self.moviesViewModel.getTrendingMovies()
    }
  }
}

struct MovieRow: View {
  
  @ObservedObject var movieViewModel = MoviesViewModel(moviesService: MoviesService())
  @State var image = UIImage()
  var movie : Movie
  
  var body: some View {
    NavigationLink(destination: MovieDetail( moviesViewModel: movieViewModel)
      .onAppear{
        movieViewModel.getMovieDeatails(id: String(movie.id ?? 0))
      }
    ) {
      HStack {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
          .onReceive(movieViewModel.$data) { data in
            guard let data = data else { return }
            self.image = UIImage(data: data) ?? UIImage()
          }
        VStack{
          Text(movie.title ?? "")
          Text(movie.releaseDate ?? "")
        }
      }
    }
    .onAppear {
      self.movieViewModel.loadData(from: movie.posterPath ?? "")
    }
  }
}


