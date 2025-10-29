//
//  EmptyDataCard.swift
//  TiMeFront
//
//  Created by Thibault on 27/10/2025.
//

import SwiftUI

struct EmptyDataCard: View {
    let icon: String
    let label: String
    
    var body: some View {
        DashboardCard {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(Color("PurpleText").opacity(0.3))
                
                Text(label)
                    .font(.system(size: 8))
                    .foregroundStyle(Color("PurpleText").opacity(0.4))
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(DesignSystem.CornerRadius.card)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card)
                .stroke(Color("PurpleText").opacity(0.15), style: StrokeStyle(lineWidth: 1.5, dash: [3]))
        )
    }
}
