//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by aedhaoui on 30/09/2023.
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
