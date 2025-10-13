//
//  DashboardGridView.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct DashboardGridView: View {
    
    let spacing = DesignSystem.Grid.spacing
    @State private var emotionViewModel = EmotionOfTheDayViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width - (DesignSystem.Grid.padding * 2)
            let cellSize = DesignSystem.Grid.cellSize(
                availableWidth: availableWidth,
                columns: 4
            )
            
            VStack(spacing: spacing) {
                
                // LIGNE 1 & 2: Défi + Livres + Diamant + Graph
                HStack(alignment: .top, spacing: spacing) {
                    
                    // Défi (2×2)
                    NavigationLink(value: DashboardDestination.challenge) {
                        DashboardCard {
                            ChallengeCardContent(
                                title: "Défi",
                                description: "Prend du temps pour toi en t'appliquant un soin du visage"
                            )
                            .background(Color(.white))
                        }
                        .frame(
                            width: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing),
                            height: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing)
                        )
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                    
                    NavigationLink(value: DashboardDestination.jarChallenge) {
                        DashboardCard {
                            ChallengeJarCardContent()
                        }
                        .frame(
                            width: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing),
                            height: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing)
                        )
                    }.buttonStyle(.plain)
                    
                    VStack(spacing: spacing) {
                        HStack(spacing: spacing) {
                            
                            // Livres (1×1)
                            NavigationLink(value: DashboardDestination.books) {
                                DashboardCard {
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Image("ButtonBooks")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: cellSize * 0.5, height: cellSize * 0.8, alignment: .bottom)
                                    }
                                        .background(
                                            Image("BackgroundDots")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 300, height: 500)
                                        )
                                }
                                .frame(width: cellSize, height: cellSize)
                            }
                            .buttonStyle(.plain)
                            .contentShape(Rectangle())
                            
                            // Streak (1×1)
                            NavigationLink(value: DashboardDestination.streak) {
                                DashboardCard {
                                    VStack {
                                        Image("StreakSmall")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: cellSize * 0.5, height: cellSize * 0.5)
                                        
                                        Text("Jour 6")
                                            .font(.system(size: 12).width(.expanded).weight(.medium))
                                            .foregroundStyle(Color("PurpleDark"))
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(.white)
                                }
                                .frame(width: cellSize, height: cellSize)
                            }
                            .buttonStyle(.plain)
                            .contentShape(Rectangle())
                        }
                        
                        // Graph (2×1)
                        NavigationLink(value: DashboardDestination.graph) {
                            DashboardCard {
                                HabitGraphCardContent(moodBars: [
                                    MoodBar(filledBars: 4, color: .red),
                                    MoodBar(filledBars: 2, color: Color(red: 0.7, green: 0.6, blue: 0.9)),
                                    MoodBar(filledBars: 7, color: .green),
                                    MoodBar(filledBars: 4, color: .orange)
                                ])
                            }
                            .frame(
                                width: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing),
                                height: cellSize
                            )
                        }
                        .buttonStyle(.plain)
                        .contentShape(Rectangle())
                    }
                }
                
                // LIGNE 2: Micro + Rédaction + Joyeuse
                HStack(spacing: spacing) {
                    
                    // Micro (1×1)
                    NavigationLink(value: DashboardDestination.microphone) {
                        DashboardCard {
                            IconCardContent(icon: "mic.fill.badge.plus", color: Color("PurpleDark"))
                        }
                        .frame(width: cellSize, height: cellSize)
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                    
                    // Rédaction (2×1)
                    NavigationLink(value: DashboardDestination.journal) {
                        DashboardCard {
                            JournalCardContent(title: "Rédaction du jour")
                        }
                        .frame(
                            width: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing),
                            height: cellSize
                        )
                    }
                    .buttonStyle(.plain)
                    .contentShape(Rectangle())
                    
                    // Joyeuse (1×1)
                    DashboardCard {
                        MoodValidationCardContent(
                            onValidate: {
                                Task {
                                    await emotionViewModel.addEmotionOfTheDay()
                                }
                            },
                            showSuccess: emotionViewModel.showSuccess,
                            emotionTitle: emotionViewModel.dailyEmotion?.title ?? "Chargement..."
                        )
                    }
                    .frame(width: cellSize, height: cellSize)
                }
            }
            .padding(DesignSystem.Grid.padding)
        }
        .frame(minWidth: 1)
        .task {
            await emotionViewModel.loadDailyEmotion()
        }
    }
}

#Preview {
    DashboardGridView()
        .background(Color(.white))
}
