//
//  Bundle++.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation

extension Bundle {
    static func decodeJson<D: Decodable>(filename: String) throws -> D {
        guard let url = main.url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
        
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(D.self, from: data)
        return decoded
    }
}
