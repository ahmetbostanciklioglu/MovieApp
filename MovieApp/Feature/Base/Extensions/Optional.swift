//
//  Optional.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self  else { return "" }
        return self
    }
}

/*
    var name: String?
    print(name.stringValue)
 
 */
