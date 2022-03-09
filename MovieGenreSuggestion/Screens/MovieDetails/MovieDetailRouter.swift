//
//  MovieDetailRouter.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 8.3.2022.
//

import Foundation

protocol MovieDetailRoute {
    func openDetails(movie: Movie)
}

extension MovieDetailRoute where Self: Router {
    func openDetails(movie: Movie) {
        openDetails(with: PushTransition(), movie: movie)
    }
    
    func openDetails(with transition: Transition, movie: Movie) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = MovieDetailViewModel(router: router, movie: movie)
        let viewController = MovieDetailViewController(viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
}

extension DefaultRouter: MovieDetailRoute {}
