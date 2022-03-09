//
//  Transition.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 8.3.2022.
//

import UIKit

protocol Transition {
    var isAnimated: Bool { get set }

    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?)
    func close(_ viewController: UIViewController, completion: (() -> Void)?)
}

final class EmptyTransition {
    var isAnimated: Bool = true
}

extension EmptyTransition: Transition {
    // MARK: - Transition
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
