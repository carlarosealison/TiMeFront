//
//  FlowerSettingsButton.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct FlowerSettingsButton: View {
    let action: () -> Void
    @State private var isPressed = false
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        Button(action: {
            action()
            // Animation de rotation au tap
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                rotationAngle += 360
            }
        }) {
            ZStack {
                // Forme de fleur avec couleur violette
                OrganicFlowerShape()
                    .fill(Color("PurpleText"))
                    .frame(width: 56, height: 56)
                    .shadow(
                        color: Color("PurpleText").opacity(0.3),
                        radius: isPressed ? 4 : 8,
                        x: 0,
                        y: isPressed ? 2 : 4
                    )
                
                // Icône engrenage
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(rotationAngle))
            }
        }
        .scaleEffect(isPressed ? 0.92 : 1.0)
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(
            minimumDuration: .infinity,
            maximumDistance: .infinity
        ) { 
            // Au toucher
        } onPressingChanged: { pressing in
            withAnimation(.easeInOut(duration: 0.15)) {
                isPressed = pressing
            }
        }
    }
}

#Preview {
    FlowerSettingsButton(action: {})
}
