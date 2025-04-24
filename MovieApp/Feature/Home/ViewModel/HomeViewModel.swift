//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var errorMsg = ""
    
    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            trendingMovies = movieApiResponse.results
        } catch {
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchTopRatedMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            topRatedMovies = movieApiResponse.results
        } catch {
            errorMsg = "Error: \(error)"
        }
    }
}
