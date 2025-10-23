//
//  DashboardCard.swift
//  TiMeFront
//
//  Created by Thibault on 29/09/2025.
//

import SwiftUI

struct DashboardCard<Content: View>: View {
    
    let span: GridSpan
    let allowOverflow: Bool
    @ViewBuilder let content: () -> Content
    
    init(
        span: GridSpan = .small,
        allowOverflow: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.span = span
        self.allowOverflow = allowOverflow
        self.content = content
    }
    
    var body: some View {
        let card = ZStack {
            // Background TOUJOURS avec coins arrondis
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card)
                .fill(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
            
            content()
        }
            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 4)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 0)
        
        if allowOverflow {
            card
        } else {
            card.clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
        }
    }
}

#Preview {
    DashboardCard(span: .small) {
        VStack {
            Text("67")
                .font(.system(size: 48, weight: .bold))
            Text("Rédactions")
                .font(.caption)
        }
    }
    .frame(width: 150, height: 150)
    .foregroundStyle(Color("PurpleText"))
}

#Preview {
    DashboardCard {
        VStack {
            Image("StreakSmall")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Jour 6")
                .font(.system(size: 16).width(.expanded).weight(.medium))
                .fontWeight(.bold)
                .foregroundStyle(Color("PurpleDark"))
        }
    }
    .frame(width: 150, height: 150)
}
