//
//  MovieListViewModel.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//

import Foundation
import Combine

// MARK: - Movie List ViewModel
class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieResult] = []
    private var cancellables = Set<AnyCancellable>()
    private let movieService = MovieService()
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        movieService.fetchMovies()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching movies: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] movies in
                guard let moviesList = movies else { return }
                self?.movies = moviesList
            })
            .store(in: &cancellables)
    }
}
