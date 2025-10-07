//
//  DesignSystem.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

enum DesignSystem {
    
    enum Grid {
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 16
        
        static func cellSize(
            availableWidth: CGFloat,
            columns: Int
        ) -> CGFloat {
            let totalHorizontalSpacing = spacing * CGFloat(columns - 1)
            let calculatedSize = (availableWidth - totalHorizontalSpacing) / CGFloat(columns)
            
            // Protection contre les valeurs négatives ou invalides
            return max(calculatedSize, 1)
        }
        
        static func cardSize(
            cells: Int,
            cellSize: CGFloat,
            spacing: CGFloat
        ) -> CGFloat {
            let calculatedSize = cellSize * CGFloat(cells) + spacing * CGFloat(cells - 1)
            
            // Protection contre les valeurs négatives ou invalides
            return max(calculatedSize, 1)
        }
    }
    
    enum CornerRadius {
        static let card: CGFloat = 20
    }
}
