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
        VStack(alignment: .leading, spacing: 24) {
            
            Spacer()
                .frame(height: 80)
            
            // MARK: - Section Ressentis
            VStack(alignment: .leading, spacing: 16) {
                Text("Ressentis")
                    .semiBoldCondensedTitle()
                
                HStack(spacing: 20) {
                    Spacer()
                    // Heart Level
                    if dayEntry.heartLevel != nil {
                        DashboardCard {
                            VStack {
                                IconCardContent(
                                    icon: "heart.fill",
                                    color: Color("PurpleButton"),
                                    size: .large
                                )
                            }
                        }
                        .frame(width: 75, height: 75)
                    }
                    
                    // Emotion (consultation uniquement)
                    if let emotionTitle = dayEntry.emotionTitle,
                       let emotionColor = dayEntry.emotionColor {
                        ZStack {
                            DashboardCard {
                                MoodValidationCardContent(
                                    onValidate: {},
                                    onDelete: {},
                                    showSuccess: true,
                                    emotionTitle: emotionTitle,
                                    categoryID: nil,
                                    backgroundColor: ColorMapper.color(from: emotionColor),
                                    buttonOffset: CGSize(width: 10, height: 10)
                                )
                            }
                        }
                        .frame(width: 75, height: 75)
                        .allowsHitTesting(false)
                    }
                    
                    // Motivation (pourcentage)
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
                    Spacer()
                }
            }
            
            // MARK: - Section Rédaction
            if let note = dayEntry.note {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Rédaction")
                        .semiBoldCondensedTitle()
                    
                    ScrollView {
                        Text(note)
                            .textCards()
                            .padding()
                            .lineSpacing(4)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .frame(maxHeight: 220)
                }
                .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        // Simule l'image du livre juste pour la preview
        Color.purple.opacity(0.1)
        
        PrivateJournalDayView(
            dayEntry: DayEntry(
                date: Date(),
                emotionTitle: "Enthousiaste",
                emotionColor: "Orange",
                heartLevel: 80,
                motivationLevel: 65,
                note: "Aujourd'hui c'était une belle journée. J'ai bien avancé sur mon projet. J'ai rencontré des personnes inspirantes et j'ai appris plein de nouvelles choses. La journée était vraiment productive et je suis content du résultat."
            )
        )
        .frame(width: 350)
    }
}
