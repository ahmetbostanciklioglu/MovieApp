//
//  SearchBar.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchTxt: String
    var body: some View {
        TextField("Search", text: $searchTxt)
            
            .overlay(
                ZStack {
                    Image.CancelIcon
                        .foregroundStyle(.white)
                        .opacity(searchTxt.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchTxt = ""
                            UIApplication.shared.endEditing()
                        }
                    Image.SearchIcon
                        .opacity(searchTxt.isEmpty ? 1.0 : 0.0)
                }
                ,alignment: .trailing)
            .foregroundStyle(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.appGrayColor1)
            )
    }
}

#Preview {
    SearchBar(searchTxt: .constant(""))
}
