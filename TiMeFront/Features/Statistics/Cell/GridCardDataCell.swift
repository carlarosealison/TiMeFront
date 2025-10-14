//
//  GridCardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct GridCardDataCell: View {
    var body: some View {
        Grid(alignment: .center, horizontalSpacing:
                8,verticalSpacing: 8){
            GridRow {
                CardDataCell(width: 150, height: 100, nbStat: 61, sizeS: 26, description: "Motivation moyenne", sizeD: 8)
                
                CardDataCell(width: 230, height: 100, nbStat: 56, sizeS: 26, description: "Text", sizeD: 8)
            }
            GridRow {
                CardDataCell(width: 250, height: 220, nbStat: 55, sizeS: 26, description: "Vocaux", sizeD: 8)
                VStack{
                    CardDataCell(width: 120, height: 100, nbStat: 56, sizeS: 26, description: "Text", sizeD: 8)
                    
                    CardDataCell(width: 120, height: 100, nbStat: 56, sizeS: 26, description: "Text", sizeD: 8)
                }
            }
        }
    }
}

#Preview {
    GridCardDataCell()
}
