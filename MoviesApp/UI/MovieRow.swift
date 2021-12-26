//
//  MovieItem.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import SwiftUI
import Combine

struct MovieRow: View {
    
    let movie : Movie
    @ObservedObject var movieViewModel = MoviesViewModel(moviesService: MoviesService())
    @State var image = UIImage()
    
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
                    Text(movie.release_date ?? "")
                }
            }
        }
        .onAppear {
            self.movieViewModel.loadData(from: movie.poster_path ?? "")
        }
    }
}





