//
//  MovieService.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//

import Foundation
import Combine

// MARK: - Movie Service
class MovieService {
    private let apiKey = "9659c03d22975c9091f6d516a9a52616"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetchMovies() -> AnyPublisher<[MovieResult]?, Error> {
        let url = URL(string: "\(baseURL)/discover/movie?api_key=\(apiKey)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieModel.self, decoder: JSONDecoder())
            .map { $0.results  ?? []}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
