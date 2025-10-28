//
//  CardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//


import SwiftUI

struct CardDataCell: View {
    let cardVM: StatisticsCardViewModel
    
    var body: some View {
        let card = cardVM.card
        
        if #available(iOS 26.0, *) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.purpleButton.opacity(0.8))
                .frame(width: cardVM.width, height: cardVM.height)
                .glassEffect(in: RoundedRectangle(cornerRadius: 12))
                .overlay(
                    VStack(spacing: 4) {
                        Text("\(card.data)")
                            .font(.system(size: cardVM.dataFontSize, weight: .bold))
                        Text(card.description)
                            .font(.system(size: cardVM.card.descriptionFontSize))
                    }
                        .foregroundStyle(.white)
                )
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    //    CardDataCell(size: CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/8),nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8)
    CardDataCell(cardVM: StatisticsCardViewModel(card: Card.card))
}
