//
//  DecorationView.swift
//  TiMeFront
//
//  Created by Thibault on 30/10/2025.
//

import SwiftUI

/// Objets décoratifs (plantes, cadres, etc.)
struct DecorationView: View {
    enum DecorationType {
        case plant
        case frame
        case vase
        case smallPlant
    }
    
    let type: DecorationType
    
    var body: some View {
        switch type {
        case .plant:
            Image("PlantDecoration") // Ton asset
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
                
        case .frame:
            Image("FrameDecoration")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 70)
                
        case .vase:
            Image("VaseDecoration")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 60)
                
        case .smallPlant:
            Image("SmallPlant")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 50)
        }
    }
}
