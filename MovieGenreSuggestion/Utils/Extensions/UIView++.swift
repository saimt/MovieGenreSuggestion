//
//  UIView++.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation
import UIKit.UIView

extension UIView {
    @discardableResult
    func heightAnchor(constant: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    @discardableResult
    func widthAnchor(constant: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    @discardableResult
    func topAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = .zero) -> Self {
        topAnchor.constraint(equalTo: anchor,
                             constant: constant).isActive = true
        return self
    }
    @discardableResult
    func bottomAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = .zero) -> Self {
        bottomAnchor.constraint(equalTo: anchor,
                                constant: -constant).isActive = true
        return self
    }
    @discardableResult
    func leadingAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = .zero) -> Self {
        leadingAnchor.constraint(equalTo: anchor,
                                 constant: constant).isActive = true
        return self
    }
    @discardableResult
    func trailingAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = .zero) -> Self {
        trailingAnchor.constraint(equalTo: anchor,
                                  constant:-constant).isActive = true
        return self
    }
    @discardableResult
    func centerHorizontal(equalTo anchor: NSLayoutAnchor <NSLayoutXAxisAnchor>, constant: CGFloat = .zero) -> Self {
        centerXAnchor.constraint(equalTo: anchor,
                                 constant: constant).isActive = true
        return self
    }
    @discardableResult
    func centerVertical(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = .zero) -> Self {
        centerYAnchor.constraint(equalTo: anchor,
                                 constant: constant).isActive = true
        return self
    }
    
    func fitInSuperview() {
       guard let sv = self.superview else { return }
       self.translatesAutoresizingMaskIntoConstraints = false
       topAnchor.constraint(equalTo: sv.topAnchor).isActive = true
       bottomAnchor.constraint(equalTo: sv.bottomAnchor).isActive = true
       leftAnchor.constraint(equalTo: sv.leftAnchor).isActive = true
       rightAnchor.constraint(equalTo: sv.rightAnchor).isActive = true
    }
}

extension UIStackView {
    func setupStandardVertical() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fill
        self.axis = .vertical
        self.alignment = .fill
    }
    func setupStandardHorizontal() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fill
        self.axis = .horizontal
        self.alignment = .fill
    }
}
