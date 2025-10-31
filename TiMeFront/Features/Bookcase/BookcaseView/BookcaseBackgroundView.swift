//
//  BookcaseBackgroundView.swift
//  TiMeFront
//

import SwiftUI

/// Fond et structure de la bibliothèque (murs, montants)
struct BookcaseBackgroundView: View {
    var body: some View {
        ZStack {
            // Fond mur
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.94, blue: 0.92),
                    Color(red: 0.92, green: 0.91, blue: 0.89)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Montants verticaux (colonnes de la bibliothèque)
            GeometryReader { geometry in
                // Montant gauche
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.4, green: 0.3, blue: 0.2),
                                Color(red: 0.35, green: 0.25, blue: 0.15)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 30)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 0)
                
                // Montant droit
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.35, green: 0.25, blue: 0.15),
                                Color(red: 0.4, green: 0.3, blue: 0.2)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 30)
                    .offset(x: geometry.size.width - 30)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: -2, y: 0)
            }
        }
        .ignoresSafeArea()
    }
}