//
//  MovieDetailView.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieResult
    
    var body: some View {
        List {
            if let url = movie.posterURL {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .listRowInsets(EdgeInsets())
            }
            
            Section(header: Text("Movie Info")) {
                Text(movie.title ?? "Unknown")
                                    .font(.title)
                                    .bold()
                Text("Release Year: \(String(describing: movie.releaseDate))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Section(header: Text("Overview")) {
                Text(movie.overview!)
                    .font(.body)
            }
        }
        .navigationTitle("Movie Details")
    }
}


#Preview {
    MovieDetailView(movie: MovieResult(adult: false, backdropPath: "/9nhjGaFLKtddDPtPaX5EmKqsWdH.jpg", genreIDS: [10749,878,53], _id: 950396, originalLanguage: "en", originalTitle: "The Gorge", overview: "Two highly trained operatives grow close from a distance after being sent to guard opposite sides of a mysterious gorge. When an evil below emerges, they must work together to survive what lies within.", popularity: 2415.786, posterPath: "/7iMBZzVZtG0oBug4TfqDb9ZxAOa.jpg", releaseDate: "2025-02-13", title: "The Gorge", video: false, voteAverage: 7.777, voteCount: 1620))
}
