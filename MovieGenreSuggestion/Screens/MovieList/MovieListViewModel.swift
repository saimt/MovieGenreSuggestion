//
//  MovieListViewModel.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation
import Combine

class MovieListViewModel {
    typealias Routes = MovieListRoute & MovieDetailRoute
    var movieList = PassthroughSubject<[Movie], Never>()
    lazy var allMovies = getMovieList()
    private var router: Routes!
    
    convenience init(router: Routes) {
        self.init()
        self.router = router
    }
    
    private func getMovieList() -> MovieResponse {
        return try! Bundle.decodeJson(filename: "movies")
    }
    
    func fetchMovies() {
        movieList.send(allMovies.movies)
    }
    
    func searchMovie(searchString: String) {
        if searchString == "" {
            movieList.send(allMovies.movies)
            return
        }
        let movies = allMovies.movies
        let filteredArray = movies.filter { movie in
            return movie.title.range(of: searchString, options: .caseInsensitive) != nil ||
            movie.genreString.range(of: searchString, options: .caseInsensitive) != nil
        }
        movieList.send(filteredArray)
    }
    
    func openDetails(of movie: Movie) {
        router.openDetails(movie: movie)
    }
}
