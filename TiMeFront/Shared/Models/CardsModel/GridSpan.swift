//
//  GridSpan.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import Foundation

struct GridSpan: Equatable {
    let width: Int
    let height: Int
    
    static let small = GridSpan(width: 1, height: 1)
    static let wide = GridSpan(width: 2, height: 1)
    static let tall = GridSpan(width: 1, height: 2)
    static let medium = GridSpan(width: 2, height: 2)
}
