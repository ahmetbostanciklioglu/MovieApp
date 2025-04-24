//
//  CustomImageView.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import SwiftUI

struct CustomImageView: View {
    let movie: Movie
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: movie.imageUrlString)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CustomImageView(movie: Preview.dev.movie, itemWidth: 150, itemHeight: 150)
}
