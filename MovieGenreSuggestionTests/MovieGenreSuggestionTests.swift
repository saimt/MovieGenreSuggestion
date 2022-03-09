//
//  MovieGenreSuggestionTests.swift
//  MovieGenreSuggestionTests
//
//  Created by Saim Tanveer on 7.3.2022.
//

import XCTest
@testable import MovieGenreSuggestion

class MovieGenreSuggestionTests: XCTestCase {

    func testUsingSimpleMock() { 
        let mockSession = URLSessionMock()
        mockSession.data = "testData".data(using: .ascii)
        let exp = expectation(description: "Loading URL")
        NetworkManager.downloadData(url: "movieId", mockSession) { data in
            exp.fulfill()
        }
        waitForExpectations(timeout:  1.0)
    }
}


