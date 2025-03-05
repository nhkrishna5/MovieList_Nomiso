//
//  MovieListView.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//

import Foundation
import SwiftUI

// MARK: - Movie List View
struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies, id: \.id) { movie in
                    movieRow(movie)
                }
            }
            .navigationTitle("Movies")
        }
    }
    
    // Move row layout into a separate function
    @ViewBuilder
    private func movieRow(_ movie: MovieResult) -> some View {
        NavigationLink(destination: MovieDetailView(movie: movie)) {
            HStack {
                if let url = movie.posterURL {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 75)
                }
                VStack(alignment: .leading) {
                    Text(movie.title ?? "Unknown").font(.headline)
                    Text(movie.releaseDate ?? "unknown").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
    }
}



#Preview {
    MovieListView()
}
