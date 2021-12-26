//
//  MoviesList.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import SwiftUI

struct MoviesList: View {
    
    @ObservedObject var moviesViewModel : MoviesViewModel
    
    
    var body: some View {
        
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
}


