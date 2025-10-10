//
//  OrganicFlowerShape.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct OrganicFlowerShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            let center = CGPoint(x: width/2, y: height/2)
            let radius = min(width, height) / 2
            
            // 6 pétales
            let petalCount = 6
            let petalWidthRatio: CGFloat = 0.55  // Fin
            let petalLengthRatio: CGFloat = 0.9   // Allongé
            
            for i in 0..<petalCount {
                // Angle de rotation pour chaque pétale
                let baseAngle = (CGFloat(i) * 2 * .pi / CGFloat(petalCount))
                
                // Création d'un pétale en forme de goutte
                let petalPath = Path { p in
                    // Point de départ au centre
                    p.move(to: .zero)
                    
                    // Courbe gauche du pétale
                    p.addCurve(
                        to: CGPoint(x: 0, y: -radius * petalLengthRatio),
                        control1: CGPoint(x: -radius * petalWidthRatio * 0.35, y: -radius * 0.1),
                        control2: CGPoint(x: -radius * petalWidthRatio, y: -radius * 0.65)
                    )
                    
                    // Courbe droite du pétale
                    p.addCurve(
                        to: .zero,
                        control1: CGPoint(x: radius * petalWidthRatio, y: -radius * 1),
                        control2: CGPoint(x: radius * petalWidthRatio * 0.6, y: -radius * 0.4)
                    )
                }
                
                // Rotation et translation
                let transform = CGAffineTransform(translationX: center.x, y: center.y)
                    .rotated(by: baseAngle)
                
                path.addPath(petalPath.applying(transform))
            }
        }
    }
}

#Preview {
    OrganicFlowerShape()
}
