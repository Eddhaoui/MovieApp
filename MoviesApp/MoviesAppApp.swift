//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by aedhaoui on 25/12/2021.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesList(moviesViewModel: MoviesViewModel(moviesService: MoviesService()))
               
        }
    }
}
