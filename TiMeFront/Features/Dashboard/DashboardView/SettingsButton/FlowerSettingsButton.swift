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
    @State private var gearRotation: Double = 0
    
    var body: some View {
        if #available(iOS 26.0, *) {
            Button(action: {
                action()
                withAnimation(.easeInOut(duration: 0.6)) {
                    gearRotation += 90
                }
            }) {
                ZStack {
                    // Forme fleur
                    OrganicFlowerShape()
                        .fill(Color("PurpleText"))
                        .frame(width: 36, height: 36)
                    
                    // Engrenage avec rotation
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(gearRotation))
                }
            }
            .buttonStyle(.glass)
            .scaleEffect(isPressed ? 0.92 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isPressed)
            .onLongPressGesture(
                minimumDuration: .infinity,
                maximumDistance: .infinity
            ) {  } onPressingChanged: { pressing in
                isPressed = pressing
            }
        } else {
        }
    }
}

#Preview {
            FlowerSettingsButton(action: {})
    }

