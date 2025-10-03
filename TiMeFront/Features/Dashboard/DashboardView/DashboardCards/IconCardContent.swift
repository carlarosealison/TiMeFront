//
//  IconCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

enum CardIconType {
    case sfSymbol(String)
    case assetImage(String)
    case text(String)
}

struct IconCardContent: View {
    
    let iconType: CardIconType
    let color: Color
    
    // Initializer pour SF Symbol
    init(icon: String, color: Color) {
        self.iconType = .sfSymbol(icon)
        self.color = color
    }
    
    // Initializer pour Asset Image
    init(assetImage: String, color: Color) {
        self.iconType = .assetImage(assetImage)
        self.color = color
    }
    
    // Initializer pour texte
    init(text: String, color: Color) {
        self.iconType = .text(text)
        self.color = color
    }
    
    var body: some View {
        Group {
            switch iconType {
            case .sfSymbol(let name):
                Image(systemName: name)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(color)
                
            case .assetImage(let name):
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                
            case .text(let content):
                Text(content)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(color)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.white))
    }
}

#Preview {
    DashboardCard {
        IconCardContent(
            icon: "mic.fill.badge.plus",
            color: Color("PurpleDark")
        )
    }
    .frame(width: 150, height: 150)
}
