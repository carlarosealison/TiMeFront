//
//  FullGraphCell.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 30/10/2025.


import SwiftUI

struct FullGraphCell: View {
    var emotionStats: [EmotionCategoryStats]
    
    // Assure toujours 7 catégories
    var paddedStats: [EmotionCategoryStats] {
        var stats = emotionStats
        let placeholdersNeeded = max(0, 7 - stats.count)
        for _ in 0..<placeholdersNeeded {
            stats.append(EmotionCategoryStats(id: UUID(), title: "-", color: "gray", count: 0))
        }
        return stats
    }
    
    var body: some View {
        VStack{
            Text("Taux")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
               //.padding(.leading, 14)
            
            HStack(alignment: .bottom, spacing: 12) {
                // Axe Y
                VStack(alignment: .trailing, spacing: 2) {
                    ForEach([100,90,80,70,60,50,40,30,20,10], id: \.self) { value in
                        Text("\(value)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                
                // Graphique
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(paddedStats) { stat in
                        VStack(spacing: 6) {
                            ForEach((0..<11).reversed(), id: \.self) { index in
                                Capsule()
                                    .fill(index < min(stat.count, 11) ? ColorMapper.color(from: stat.color) : Color.gray.opacity(0.15))
                                    .frame(width: 30, height: 8)
                            }
                        }
                    }
                }
            }
            
            Text("Humeurs")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
                //.padding(.trailing)
        }
        .padding()

    }
}

#Preview {
    FullGraphCell(emotionStats: [EmotionCategoryStats(id: UUID(), title: "", color: "purple", count: 8)])
}
