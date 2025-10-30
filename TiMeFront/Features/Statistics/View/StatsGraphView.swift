//
//  StatsGraphView.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct StatsGraphView: View {
    
    @State private var currentPage = 0
    var emotionStats: [EmotionCategoryStats]
    
    // Transforme emotionStats en MoodBar pour FullGraphView
    var moodBars: [MoodBar] {
        emotionStats.map { stat in
            MoodBar(filledBars: stat.count, color: ColorMapper.color(from: stat.color))
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.whitePurple)
                .frame(height: 270)
            
            VStack {
                Text("Taux")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 38)
                
                TabView(selection: $currentPage) {
                    
                    // Bar chart basé sur les émotions
                    FullGraphCell(emotionStats: emotionStats)
                        .tag(0)
                    
                    // Donut chart
                    DonutDataCell(emotionStats: emotionStats)
                        .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 180)
                
                // Indicateurs de page
                HStack(spacing: 8) {
                    ForEach(0..<2, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color("PurpleDark") : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                
                Text("Humeurs")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 60)
            }
        }
    }
}


#Preview {
    StatsGraphView(
        emotionStats: [
            EmotionCategoryStats(id: UUID(), title: "Joie", color: "violet", count: 12),
            EmotionCategoryStats(id: UUID(), title: "Tristesse", color: "rose", count: 8),
            EmotionCategoryStats(id: UUID(), title: "Colère", color: "bleu", count: 5),
            EmotionCategoryStats(id: UUID(), title: "Sérénité", color: "orange", count: 10),
            EmotionCategoryStats(id: UUID(), title: "Sérénité", color: "bleu", count: 0),
            EmotionCategoryStats(id: UUID(), title: "Sérénité", color: "rouge", count: 0),
            EmotionCategoryStats(id: UUID(), title: "Sérénité", color: "vert", count: 4),
        ]
    )
}
