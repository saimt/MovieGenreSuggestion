//
//  MovieListRouter.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 8.3.2022.
//

import Foundation
import UIKit

protocol MovieListRoute {
    func openList() -> UIViewController
}

extension MovieListRoute where Self: Router {
    func openList() -> UIViewController {
        openList(with: EmptyTransition())
    }
    
    func openList(with transition: Transition) -> UIViewController {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = MovieListViewModel(router: router)
        let viewController = MovieListViewController(viewModel)
        router.root = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.tintColor = .black
        return navigation
    }
}

extension DefaultRouter: MovieListRoute {}
