//
//  NSObject++.swift
//  MovieGenreSuggestion
//
//  Created by Saim Tanveer on 7.3.2022.
//

import Foundation

extension NSObject {
    public static func Init<Type>(value : Type, block: (_ object: Type) -> Void) -> Type {
       block(value)
       return value
    }
    
    static var name: String {
        return "\(self)"
    }
}
