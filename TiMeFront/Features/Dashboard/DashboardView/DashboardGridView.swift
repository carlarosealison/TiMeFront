//
//  DashboardGridView.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct DashboardGridView: View {
    
    let spacing = DesignSystem.Grid.spacing
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width - (DesignSystem.Grid.padding * 2)
            let cellSize = DesignSystem.Grid.cellSize(
                availableWidth: availableWidth,
                columns: 4
            )
            
            VStack(spacing: spacing) {
                
                // LIGNE 1 + 2: Défi + Livres + Diamant + Graph
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
                    
                    VStack(spacing: spacing) {
                        HStack(spacing: spacing) {
                            // Livres (1×1)
                            NavigationLink(value: DashboardDestination.books) {
                                DashboardCard {
                                    Image("ButtonBooks")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: cellSize * 0.8, height: cellSize * 0.8)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            Image("BackgroundDots")
                                                .resizable()
                                                .scaledToFill()
                                        )
                                }
                                .frame(width: cellSize, height: cellSize)
                            }.buttonStyle(.plain)
                            
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
                            }.buttonStyle(.plain)
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
                    }.buttonStyle(.plain)
                    }
                }
                
                // LIGNE 2: Micro + Rédaction + Joyeuse
                HStack(spacing: spacing) {
                    
                    // Micro (1×1)
                    NavigationLink(value: DashboardDestination.journal) {
                        DashboardCard {
                            IconCardContent(icon: "mic.fill.badge.plus", color: Color("PurpleDark"))
                        }
                        .frame(width: cellSize, height: cellSize)
                    }.buttonStyle(.plain)
                    
                    // Rédaction (2×1)
                    NavigationLink(value: DashboardDestination.journal) {
                        DashboardCard {
                            JournalCardContent(title: "Rédaction du jour")
                        }
                        .frame(
                            width: DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing),
                            height: cellSize
                        )
                    }.buttonStyle(.plain)
                    
                    // Joyeuse (1×1)
                    DashboardCard {
                        MoodValidationCardContent {
                            // Action à exécuter lors de la validation
                            print("Humeur ajoutée")
                            // Plus tard : viewModel.validateMood()
                        }
                    }
                    .frame(width: cellSize, height: cellSize)
                }
            }
            .padding(DesignSystem.Grid.padding)
        }
        .frame(minWidth: 1)
    }
}

#Preview {
    DashboardGridView()
        .background(Color(.white))
}
