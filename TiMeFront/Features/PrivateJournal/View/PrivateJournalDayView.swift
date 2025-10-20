//
//  PrivateJournalDayView.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

struct PrivateJournalDayView: View {
    let dayEntry: DayEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Section Ressentis
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ressentis")
                        .semiBoldCondensedTitle()
                    
                    HStack(spacing: 20) {
                        // Heart Level
                        if let heartLevel = dayEntry.heartLevel {
                            DashboardCard {
                                IconCardContent(
                                    icon: "heart.fill",
                                    color: Color("PurpleButton"),
                                    size: .large
                                )
                            }
                            .frame(width: 75, height: 75)
                        }
                        
                        // Emotion (consultation uniquement donc onValidate vide)
                        if let emotionTitle = dayEntry.emotionTitle,
                           let emotionColor = dayEntry.emotionColor {
                            DashboardCard {
                                MoodValidationCardContent(
                                    onValidate: {},
                                    showSuccess: true,
                                    emotionTitle: emotionTitle,
                                    categoryID: nil,
                                    backgroundColor: ColorMapper.color(from: emotionColor)
                                )
                            }
                            .frame(width: 75, height: 75)
                            .allowsHitTesting(false)
                        }
                        
                        // Motivation
                        if let motivation = dayEntry.motivationLevel {
                            DashboardCard {
                                IconCardContent(
                                    text: "\(motivation)%",
                                    color: Color("PurpleButton"),
                                    size: .regularPurple
                                )
                            }
                            .frame(width: 75, height: 75)
                        }
                    }
                }
                
                // MARK: - Section Rédaction
                if let note = dayEntry.note {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Rédaction")
                            .semiBoldCondensedTitle()
                        
                        Text(note)
                            .textCards()
                            .padding()
                            .lineSpacing(4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                }
            }
            .padding()
        }
    }
    
    // Fonction pour mapper les noms de couleur backend vers tes Assets
    private func colorFromName(_ colorName: String) -> Color {
        switch colorName.lowercased() {
        case "orange":
            return Color("OrangeCustomCard")
        case "rose", "pink":
            return Color("PinkCustomClear")
        case "violet", "purple":
            return Color("PurpleButton")
        default:
            return Color("PurpleButton") // Couleur par défaut
        }
    }
}

#Preview {
    PrivateJournalDayView(
        dayEntry: DayEntry(
            date: Date(),
            emotionTitle: "Enthousiaste",
            emotionColor: "Orange",
            heartLevel: 80,
            motivationLevel: 65,
            note: "Aujourd'hui c'était une belle journée. J'ai bien avancé sur mon projet."
        )
    )
}
