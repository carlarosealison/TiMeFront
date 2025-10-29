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
    let backgroundColor: Color?
    @ViewBuilder let content: () -> Content
    
    init(
        span: GridSpan = .small,
        allowOverflow: Bool = false,
        backgroundColor: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.span = span
        self.allowOverflow = allowOverflow
        self.backgroundColor = backgroundColor
        self.content = content
    }
    
    var body: some View {
        let card = ZStack {
            if let bgColor = backgroundColor {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card)
                    .fill(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
            } else {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card)
                    .fill(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
            }
            
            content()
        }
        
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
