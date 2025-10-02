struct OrganicFlowerShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            let centerX = width / 2
            let centerY = height / 2
            
            // Rayon pour les pétales
            let petalRadius = min(width, height) * 0.35
            let centerRadius = min(width, height) * 0.25
            
            // 5 pétales positionnés comme sur ton image
            let petalPositions: [(angle: CGFloat, scale: CGFloat)] = [
                (-90, 1.0),  // Haut
                (-18, 1.0),  // Haut-droite
                (54, 1.0),   // Bas-droite
                (126, 1.0),  // Bas-gauche
                (198, 1.0)   // Haut-gauche
            ]
            
            // Dessine chaque pétale avec des courbes douces
            for (angleDegrees, scale) in petalPositions {
                let angle = angleDegrees * .pi / 180
                let petalX = centerX + cos(angle) * centerRadius
                let petalY = centerY + sin(angle) * centerRadius
                
                path.addEllipse(in: CGRect(
                    x: petalX - petalRadius * scale,
                    y: petalY - petalRadius * scale,
                    width: petalRadius * scale * 2,
                    height: petalRadius * scale * 2
                ))
            }
            
            // Centre unifiant
            path.addEllipse(in: CGRect(
                x: centerX - centerRadius,
                y: centerY - centerRadius,
                width: centerRadius * 2,
                height: centerRadius * 2
            ))
        }
    }
}