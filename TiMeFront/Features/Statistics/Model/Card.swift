//
//  Card.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 26/10/2025.
//

import Foundation

struct Card: Identifiable {
    
    let id = UUID()
    let data: Int
    let description: String
    let size: CardSize
    
    let dataSize: DataSize
    let descriptionFontSize: CGFloat = 8
    
    enum CardSize {
        case small
        case medium
        case mediumLarge
        case large
    }
    
    enum DataSize{
        case small
        case medium
        case large
    }
}

extension Card{
    static let card = Card(data: 24, description: "Streaks", size: .small, dataSize: .medium)
}

