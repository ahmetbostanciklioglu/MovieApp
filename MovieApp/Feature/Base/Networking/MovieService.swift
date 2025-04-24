//
//  MovieService.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import Foundation

enum MoviServiceError: Error {
case invalidResponse
}

actor MovieService {
    func fetchData<T: Decodable>(api: ApiConstructor) async throws -> T {
        let url = try DefaultUrlBuilder.build(api: api)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw MoviServiceError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
