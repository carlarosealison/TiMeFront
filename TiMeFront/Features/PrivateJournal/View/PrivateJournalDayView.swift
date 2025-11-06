    //
    //  PrivateJournalDayView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 15/10/2025.
    //

import SwiftUI



struct PrivateJournalDayView: View {
    @Binding var journalEditorVM : JournalEditorViewModel
    let dayEntry: DayEntry
        
        var body: some View {
            VStack(alignment: .leading, spacing: 24) {
                if #available(iOS 26.0, *) {
                    
                    Spacer()
                        .frame(height: 80)
                    
                    // MARK: - Section Ressentis
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Ressentis")
                            .semiBoldCondensedTitle()
                        
                        

                        
                        HStack(spacing: 32.5) {
                            
                            // Heart Level
                            if dayEntry.heartLevel != nil {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.whitePurple)
                                        .frame(width: 75, height: 75)
                                    
                                    HeartLevelView(viewModel: $journalEditorVM)
                                        .padding(10)
                                }
                            } else {
                                EmptyDataCard(
                                    icon: "heart",
                                    label: "Ressenti"
                                )
                                .frame(width: 75, height: 75)
                            }
                            
                            
                            // Emotion
                            if let emotionTitle = dayEntry.emotionTitle,
                               let emotionColor = dayEntry.emotionColor {
                                DashboardCard(allowOverflow: true) {
                                    MoodDisplayCardContent(
                                        emotionTitle: emotionTitle,
                                        backgroundColor: ColorMapper.color(from: emotionColor)
                                    )
                                }
                                .frame(width: 75, height: 75)
                                .allowsHitTesting(false)
                            } else {
                                EmptyDataCard(
                                    icon: "brain.head.profile",
                                    label: "Emotion"
                                )
                                .frame(width: 75, height: 75)
                            }
                            
                            // Motivation
                            if let motivation = dayEntry.motivationLevel {
                                DashboardCard(backgroundColor: Color("WhitePurple")) {
                                    IconCardContent(
                                        text: "\(motivation)%",
                                        color: Color("PurpleButton"),
                                        size: .regularPurple
                                    )
                                }
                                .frame(width: 75, height: 75)
                            } else {
                                EmptyDataCard(
                                    icon: "percent",
                                    label: "Motivation"
                                )
                                .frame(width: 75, height: 75)
                            }
                        }
                        .frame(width: 290)
                    }
                    //TODO: fetch le heartLevel
//                    .task {
//                        await journalEditorVM.
//                    }
                    
                    // MARK: - Section Rédaction
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Rédaction")
                            .semiBoldCondensedTitle()
                        
                        if let note = dayEntry.note {
                            ScrollView {
                                Text(note)
                                    .textCards()
                                    .padding()
                                    .lineSpacing(4)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .background(Color("WhitePurple"))
                            .cornerRadius(20)
                            .frame(width: 290, height: 220)
                            
                        } else {
                            // Placeholder vide
                            VStack(spacing: 12) {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 40))
                                    .foregroundStyle(Color("PurpleText").opacity(0.3))
                                
                                Text("Ajouter une note")
                                    .font(.caption)
                                    .foregroundStyle(Color("PurpleText").opacity(0.5))
                            }
                            .frame(width: 290, height: 220)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("PurpleText").opacity(0.2), style: StrokeStyle(lineWidth: 2, dash: [5]))
                            )
                        }
                    }
                    
                    Spacer()
                }
            }
            .task {
                await journalEditorVM.fetchHeartLevels()
                journalEditorVM.fetchHeartLevel()
//                await  journalEditorVM.fetchMotivation(motivationID: )
            }

        }
    
}

    // Preview 1 - Jour complet
#Preview("Jour complet") {
    ZStack {
        Color.purple.opacity(0.1)
        
        if #available(iOS 26.0, *) {
            PrivateJournalDayView(
                journalEditorVM: .constant(JournalEditorViewModel()),
                dayEntry: DayEntry(
                    date: Date(),
                    emotionTitle: "Enthousiaste",
                    emotionColor: "Orange",
                    heartLevel: 80,
                    motivationLevel: 65,
                    note: "Aujourd'hui c'était une belle journée. J'ai bien avancé sur mon projet."
                )
            )
            .frame(width: 290)
        }
    }
}

    // Preview 2 - Jour partiel
#Preview("Jour partiel") {
    ZStack {
        Color.purple.opacity(0.1)
        
        if #available(iOS 26.0, *) {
            PrivateJournalDayView(
                journalEditorVM: .constant(JournalEditorViewModel()),
                dayEntry: DayEntry(
                    date: Date(),
                    emotionTitle: "Joyeuse",
                    emotionColor: "Orange",
                    heartLevel: nil,
                    motivationLevel: nil,
                    note: nil
                )
            )
            .frame(width: 290)
        }
    }
}
