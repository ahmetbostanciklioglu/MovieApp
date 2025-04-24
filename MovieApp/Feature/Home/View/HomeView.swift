//
//  HomeView.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var searchTxt = ""
    @StateObject private var viewModel = HomeViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchTxt: $searchTxt)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.trendingMovies) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                }
                
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.topRatedMovies) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBackgroundColor)
        .scrollIndicators(.hidden)
        .task {
            await viewModel.fetchTrendingMovies()
            await viewModel.fetchTopRatedMovies()
        }
    }
}

#Preview {
    HomeView()
}
