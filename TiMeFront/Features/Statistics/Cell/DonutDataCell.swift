//
//  DonutDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 22/10/2025.
//

import SwiftUI
import Charts



struct DonutDataCell: View {
    
    var emotionStats: [EmotionCategoryStats]

    var body: some View {
        VStack{
            if emotionStats.isEmpty{
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(.grayCustom.opacity(0.5))
                    .frame(width: 150)
            }else{
                Chart {
                    ForEach(emotionStats) { stat in
                        SectorMark(
                            angle: .value("Count", stat.count),
                            innerRadius: .ratio(0.70),
                            angularInset: 8
                        )
                        .cornerRadius(.infinity)
                        .foregroundStyle(ColorMapper.color(from: stat.color))
                    }
                }
                .frame(width: 300)
            }
        }

    }
}

#Preview {
    DonutDataCell(
        emotionStats: [
//            EmotionCategoryStats(id: UUID(), title: "Joie", color: "violet", count: 12),
//            EmotionCategoryStats(id: UUID(), title: "Tristesse", color: "rose", count: 8),
//            EmotionCategoryStats(id: UUID(), title: "Colère", color: "bleu", count: 5),
//            EmotionCategoryStats(id: UUID(), title: "Sérénité", color: "orange", count: 10)
        ]
    )
}
