//
//  MovieResponse.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation

// MARK: - MovieResponse
class MovieResponse: Codable {
    let genres: [String]
    let movies: [Movie]

    init(genres: [String], movies: [Movie]) {
        self.genres = genres
        self.movies = movies
    }
}

// MARK: - Movie
class Movie: Codable, Hashable {
    let id: Int
    let title, year, runtime: String
    let genres: [String]
    let director, actors, plot: String
    let posterURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, year, runtime, genres, director, actors, plot
        case posterURL = "posterUrl"
    }

    init(id: Int, title: String, year: String, runtime: String, genres: [String], director: String, actors: String, plot: String, posterURL: String) {
        self.id = id
        self.title = title
        self.year = year
        self.runtime = runtime
        self.genres = genres
        self.director = director
        self.actors = actors
        self.plot = plot
        self.posterURL = posterURL
    }
    
    var genreString: String {
        return genres.joined(separator: ", ")
    }
    
    var subtitle: String {
        return "\(year) | \(genreString)"
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
