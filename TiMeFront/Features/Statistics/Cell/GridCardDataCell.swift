//
//  GridCardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct GridCardDataCell: View {
    
    var body: some View {
        
        VStack{
            HStack {
                CardDataCell(width: 141, height: 75, nbStat: 61, sizeS: 8, description: "Motivation moyenne", sizeD: 8)
                
                CardDataCell(width: 217, height: 75, nbStat: 56, sizeS: 8, description: "Text", sizeD: 8)
            }
            HStack {
                    CardDataCell(width: 295, height: 143, nbStat: 55, sizeS: 8, description: "Vocaux", sizeD: 8)
                    VStack{
                        CardDataCell(width: 65, height: 65, nbStat: 21, sizeS: 8, description: "Text", sizeD: 8)
                        
                        CardDataCell(width: 65, height: 65, nbStat: 4, sizeS: 8, description: "Text", sizeD: 8)
                    }
            }
        }
    }
}

#Preview {
    GridCardDataCell()
}
