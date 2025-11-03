//
//  DecorationView.swift
//  TiMeFront
//
//  Created by Thibault on 30/10/2025.
//

import SwiftUI

/// Objets décoratifs
struct DecorationView: View {
    enum DecorationType {
        case plant
        case plant2
        case plant3
        case plant4
        case buste
        case cactus
        case painting
    }
    
    let type: DecorationType
    
    var body: some View {
        switch type {
        case .plant:
            Image("Plant")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
                
        case .plant2:
            Image("Plant2")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 70)
                
        case .plant3:
            Image("Plant3")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 50)
                
        case .plant4:
            Image("Plant4")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 50)
                
        case .buste:
            Image("Buste")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 60)
                
        case .cactus:
            Image("Cactus")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 60)
            
        case .painting:
            Image("Painting")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 60)
        }
    }
}
