//
//  NetworkManager.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 8.3.2022.
//

import Foundation

class NetworkManager {
    static func downloadData<T: URLSessionProtocol>(url: String,
                                                    _ session: T,
                                                    completionBlock: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: url) {
            let task = session.dataTask(with: url, completionHandler: {data , urlresponse, error in
                if let data = data {
                    completionBlock(.success(data))
                }
            })
            task.resume()
        }
    }
}
