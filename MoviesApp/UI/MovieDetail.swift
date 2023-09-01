//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
//

import SwiftUI

struct MovieDetail: View {
  
    @ObservedObject var moviesViewModel : MoviesViewModel
    @State var image = UIImage()
  
    var body: some View {
        
        switch moviesViewModel.moviesDeatailsLoadingState {
        case .loading :
            ProgressView()
        case .error(_) :
            ProgressView()
        case .loaded(_) :
            
            VStack(alignment: .center) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .onReceive(moviesViewModel.$data) { data in
                        guard let data = data else { return }
                        self.image = UIImage(data: data) ?? UIImage()
                    }
                Text(moviesViewModel.details.overview ?? "")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                Spacer()
            }
            .navigationTitle(moviesViewModel.details.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.moviesViewModel.loadData(from: moviesViewModel.details.posterPath ?? "")
                
            }
        }
    }
}


