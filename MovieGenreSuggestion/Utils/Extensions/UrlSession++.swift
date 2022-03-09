//
//  UrlSession++.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 8.3.2022.
//

import Foundation

protocol URLSessionProtocol {
    associatedtype dta: URLSessionDataTaskProtocol
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> dta
}
protocol URLSessionDataTaskProtocol {
    func resume()
}
extension URLSession: URLSessionProtocol {}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}


