//
//  MoodDisplayCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 22/10/2025.
//

import SwiftUI

/// Composant d'affichage d'une émotion dans le journal privé
/// Version simplifiée de MoodValidationCardContent pour la consultation uniquement
struct MoodDisplayCardContent: View {
    
    let emotionTitle: String
    let backgroundColor: Color
    
    init(
        emotionTitle: String,
        backgroundColor: Color
    ) {
        self.emotionTitle = emotionTitle
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background
            backgroundColor
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
                .allowsHitTesting(false)
            
            // Texte de l'émotion
            Text(emotionTitle)
                .font(.system(size: 12)
                    .width(.expanded)
                    .weight(.light))
                .foregroundStyle(Color("PurpleText"))
                .padding(.top, 5)
                .padding(.horizontal, 10)
        }
        .overlay(alignment: .bottomTrailing) {
            // Bouton checkmark fixe (non interactif)
            if #available(iOS 26.0, *) {
                Image(systemName: "checkmark")
                    .foregroundStyle(Color("PurpleText"))
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 36, height: 36)
                    .glassEffect(.regular.tint(Color.green.opacity(0.75)))
                    .padding(.trailing, -8)
                    .padding(.bottom, -8)
            } else {
                Image(systemName: "checkmark")
                    .foregroundStyle(Color("PurpleText"))
                    .font(.system(size: 20, weight: .light))
                    .frame(width: 36, height: 36)
                    .background(Color.green.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.trailing, -8)
                    .padding(.bottom, -8)
            }
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        DashboardCard {
            MoodDisplayCardContent(
                emotionTitle: "Enthousiaste",
                backgroundColor: Color("OrangeCustomCard")
            )
        }
        .frame(width: 75, height: 75)
    }
    .padding()
}
