//
//  MovieDetailViewModel.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation
import Combine

class MovieDetailViewModel {
    typealias Routes = MovieDetailRoute
    var movie: Movie!
    var movieId: Int!
    private var router: Routes!
    
    convenience init(router: Routes, movie: Movie) {
        self.init()
        self.movie = movie
        self.movieId = movie.id
        self.router = router
    }
    
    func downloadMovie(completionBlock: @escaping (Result<Data, Error>) -> Void) {
        let url = "https://images-na.ssl-images-amazon.com/images/M/MV5BMTU5ODAyNzA4OV5BMl5BanBnXkFtZTcwNzYwNTIzNA@@._V1_SX300.jpg"
        //TODO:
        /// when api is ready, stop using URLSessionMock() and use URLSession.shared
        let urlSession = URLSessionMock()
//        let urlSession = URLSession.shared
        NetworkManager.downloadData(url: url, urlSession, completionBlock: completionBlock)
    }
}
