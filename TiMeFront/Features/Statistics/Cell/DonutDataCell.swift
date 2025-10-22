//
//  DonutDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 22/10/2025.
//

import SwiftUI
import Charts

struct DataChart: Identifiable{
    let id = UUID()
    var emotions: Int
    var color: Color
}
struct DonutDataCell: View {
    var emotionChart : [DataChart] = [
        DataChart(emotions: 11, color: .red),
        DataChart(emotions: 8, color: .greenCustom),
        DataChart(emotions: 5, color: .orangeCustom),
        DataChart(emotions: 22, color: .purpleButton),
        DataChart(emotions: 12, color: .teal),
        DataChart(emotions: 10, color: .pinkCustomMate),
        DataChart(emotions: 14, color: .indigo)
        
    ]
    var body: some View {
        Chart {
            ForEach(emotionChart){ emotion in
                SectorMark(
                    angle: .value("Emotion", emotion.emotions),
                    innerRadius: .ratio(0.70),
                    angularInset: 8
                )
                .cornerRadius(.infinity)
                .foregroundStyle(emotion.color)
            }
        }
        .frame(width: 300)
    }
}

#Preview {
    DonutDataCell()
}
