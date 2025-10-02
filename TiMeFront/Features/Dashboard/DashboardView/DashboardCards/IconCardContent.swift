//
//  IconCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct IconCardContent: View {
    
    let icon: String
    let color: Color
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 40, weight: .semibold))
            .foregroundStyle(color)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("Micro") {
    DashboardCard(span: .small) {
        IconCardContent(
            icon: "mic.fill.badge.plus",
            color: Color("PurpleText")
        )
    }
    .frame(width: 150, height: 150)
    .padding()
}