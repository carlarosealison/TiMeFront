//
//  GridCardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct GridCardDataCell: View {
    var streak: Int
    var challengeSuccessful: Int
    var body: some View {
        
//        VStack{
//            HStack {
//                CardDataCell(width: 141, height: 75, nbStat: 61, sizeS: 26, description: "Motivation moyenne", sizeD: 8, isLargeCard: false)
//                
//                CardDataCell(width: 217, height: 75, nbStat: challengeSuccessful, sizeS: 26, description: "Défi réussi", sizeD: 8, isLargeCard: false)
//            }
//            HStack {
//                    CardDataCell(width: 295, height: 143, nbStat: 55, sizeS: 26, description: "rédaction", sizeD: 8, isLargeCard: true)
//                    VStack{
//                        CardDataCell(width: 65, height: 65, nbStat: streak, sizeS: 26, description: "Streak", sizeD: 8, isLargeCard: false)
//                        
//                        CardDataCell(width: 65, height: 65, nbStat: 4, sizeS: 26, description: "Livres", sizeD: 8, isLargeCard: false)
//                    }
//            }
//        }
    }
}

#Preview {
    GridCardDataCell(streak: 4, challengeSuccessful: 8)
}
