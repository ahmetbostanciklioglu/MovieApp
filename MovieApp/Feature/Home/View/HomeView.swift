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
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchTxt: $searchTxt)
                    .padding(.top, 10)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.trendingMovies) { movie in
                            MovieCard(movie: movie)
                            Spacer()
                                .frame(width: 36)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)  
                }
                
                Spacer()
                
                LazyVGrid(columns: columns, spacing: 16) {
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
