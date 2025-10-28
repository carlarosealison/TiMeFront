//
//  StatisticsCardViewModel.swift
//  TiMeFront
//
//  Created by apprenant152 on 28/10/2025.
//

import SwiftUI

class StatisticsCardViewModel {
    let card: Card
    
    var width: CGFloat {
        switch card.size {
        case .small: return 65
        case .medium: return 141
        case .mediumLarge: return 217
        case .large: return 295
        }
    }

    var height: CGFloat {
        switch card.size {
        case .small: return 65
        case .medium: return 75
        case .mediumLarge: return 75
        case .large: return 143
        }
    }

    var dataFontSize: CGFloat {
        switch card.dataSize{
        case .small: return 12
        case .medium: return 22
        case.large: return 26
        }
    }

    

    init(card: Card) {
        self.card = card
    }
}

extension StatisticsCardViewModel{
   static let card = Card(data: 23, description: "Streak", size: .small, dataSize: .medium)
}

