//
//  HabitGraphCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct MoodBar: Identifiable {
    let id = UUID()
    let filledBars: Int
    let color: Color
}

struct HabitGraphCardContent: View {
    
    let moodBars: [MoodBar]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            ForEach(moodBars) { bar in
                VStack(spacing: 2) {
                    ForEach((0..<11).reversed(), id: \.self) { index in
                        Capsule()
                            .fill(index < bar.filledBars ? bar.color : Color.gray.opacity(0.2))
                            .frame(width: 28, height: 3)
                    }
                }
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    DashboardCard {
        HabitGraphCardContent(moodBars: [
            MoodBar(filledBars: 4, color: .red),
            MoodBar(filledBars: 2, color: Color(red: 0.7, green: 0.6, blue: 0.9)),
            MoodBar(filledBars: 7, color: .green),
            MoodBar(filledBars: 4, color: .orange)
        ])
    }
    .frame(width: 320, height: 150)
}
