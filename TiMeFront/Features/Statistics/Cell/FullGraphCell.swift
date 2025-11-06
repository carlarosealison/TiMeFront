//
//  FullGraphCell.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 30/10/2025.


import SwiftUI

struct FullGraphCell: View {
    var emotionStats: [EmotionCategoryStats]
    
    // Assure 7 catégories pour l'affichage (évite que le graph se décale)
    var paddedStats: [EmotionCategoryStats] {
        var stats = emotionStats
        let placeholders = max(0, 7 - stats.count)
        for _ in 0..<placeholders {
            stats.append(EmotionCategoryStats(id: UUID(), title: "-", color: "gray", count: 0))
        }
        return stats
    }
    
    // Paramètres du graphique
    let segmentCount = 11
    let barWidth: CGFloat = 30
    let barHeight: CGFloat = 8
    let barSpacing: CGFloat = 6
    
    // Calcule le total pour convertir en pourcentages
    var percentages: [Double] {
        let total = paddedStats.map { Double($0.count) }.reduce(0, +)
        guard total > 0 else { return Array(repeating: 0, count: paddedStats.count) }
        return paddedStats.map { max(0, min(100, (Double($0.count) / total) * 100)) }
    }
    
    // Defini une Hauteur fixe qui permet de garantir que toutes les colonnes ont la même hauteur
    var segmentsAreaHeight: CGFloat {
        CGFloat(segmentCount) * barHeight + CGFloat(segmentCount - 1) * barSpacing
    }
    
    var body: some View {
        VStack {
            Text("Pourcentage (%)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .bottom, spacing: 12) {
                
                VStack(alignment: .trailing, spacing: 2) {
                    ForEach(Array(stride(from: 100, through: 10, by: -10)), id: \.self) { value in
                        Text("\(value)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .frame(height: segmentsAreaHeight / CGFloat(segmentCount), alignment: .trailing)
                    }
                }
                
                //MARK:  Graphique
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(paddedStats.indices, id: \.self) { i in
                        let stat = paddedStats[i]
                        let percentage = percentages[i]
                        // Nombre de segments remplis (0..segmentCount)
                        let filledSegments = Int(round((percentage / 100.0) * Double(segmentCount)))
                        
                        VStack(spacing: 6) {
                            // Zone des segments avec hauteur fixe
                            VStack(spacing: barSpacing) {
                                ForEach((0..<segmentCount).reversed(), id: \.self) { level in
                                    Capsule()
                                        .fill(level < filledSegments ? ColorMapper.color(from: stat.color) : Color.gray.opacity(0.15))
                                        .frame(width: barWidth, height: barHeight)
                                }
                            }
                            .frame(height: segmentsAreaHeight)
    
                        }
                    }
                }
            }
            
            Text("Humeurs")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }
}

#Preview {
    FullGraphCell(
        emotionStats: [
            EmotionCategoryStats(id: UUID(), title: "Joie", color: "yellow", count: 3),
            EmotionCategoryStats(id: UUID(), title: "Amour", color: "pink", count: 1),
            EmotionCategoryStats(id: UUID(), title: "Tristesse", color: "blue", count: 0)
        ]
    )
}




