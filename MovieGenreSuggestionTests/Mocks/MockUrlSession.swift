//
//  MockUrlSession.swift
//  MovieGenreSuggestionTests
//
//  Created by Saim Tanveer on 8.3.2022.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    func resume() {
        closure()
    }
}

class URLSessionMock: URLSessionProtocol {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    // data and error can be set to provide data or an error
    var data: Data?
    var error: Error?
    func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTaskMock {
        let data = self.data
        let error = self.error
        return URLSessionDataTaskMock{
            completionHandler(data, nil, error)
        }
    }
}
