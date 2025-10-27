//
//  IconCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

enum CardTextSize {
    case large    // heavyTitle (48)
    case medium   // semiBold (24)
    case regular  // semiBoldTitle (20)
    case regularPurple // semiBoldPurpleTitle (20)
    case small    // semiBoldCardsTitle (14)
    case tiny     // subTitle (12)
}

enum CardIconType {
    case sfSymbol(String)
    case assetImage(String)
    case text(String)
}

struct IconCardContent: View {
    
    let iconType: CardIconType
    let color: Color
    let size: CardTextSize
    
    // Initializer pour SF Symbol
    init(icon: String, color: Color, size: CardTextSize = .large) {
        self.iconType = .sfSymbol(icon)
        self.color = color
        self.size = size
    }
    
    // Initializer pour Asset Image
    init(assetImage: String, color: Color, size: CardTextSize = .large) {
        self.iconType = .assetImage(assetImage)
        self.color = color
        self.size = size
    }
    
    // Initializer pour texte
    init(text: String, color: Color, size: CardTextSize = .large) {
        self.iconType = .text(text)
        self.color = color
        self.size = size
    }
    
    var body: some View {
        Group {
            switch iconType {
            case .sfSymbol(let name):
                switch size {
                case .large:
                    Image(systemName: name).font(.system(size: 48, weight: .heavy))
                case .medium:
                    Image(systemName: name).font(.system(size: 24, weight: .semibold))
                case .regular:
                    Image(systemName: name).font(.system(size: 20, weight: .semibold))
                case .regularPurple:
                    Image(systemName: name).font(.system(size: 20, weight: .semibold))
                case .small:
                    Image(systemName: name).font(.system(size: 14, weight: .semibold))
                case .tiny:
                    Image(systemName: name).font(.system(size: 12, weight: .light))
                }
                
            case .assetImage(let name):
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                
            case .text(let content):
                switch size {
                case .large:
                    Text(content).heavyTitle()
                case .medium:
                    Text(content).semiBold()
                case .regular:
                    Text(content).semiBoldTitle()
                case .regularPurple:
                    Text(content).semiBoldPurpleTitle()
                case .small:
                    Text(content).semiBoldCardsTitle()
                case .tiny:
                    Text(content).subTitle()
                }
            }
        }
        .foregroundStyle(color)
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
