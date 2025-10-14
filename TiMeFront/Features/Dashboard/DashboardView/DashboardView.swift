//
//  DashboardView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI
import CoreMotion

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                
                VStack {
                    DashboardHeaderView()
                    
                    Spacer()
                    
                    Text("Ici on trouvera l'affirmation du jour pour ne pas encombrer une des bulles en dessous.")
                        .font(Font.custom("SF Pro", size: 26))
                        .padding()
                    
                    Spacer()
                    
                    GeometryReader { geometry in
                        let availableWidth = geometry.size.width - (DesignSystem.Grid.padding * 2)
                        let cellSize = DesignSystem.Grid.cellSize(
                            availableWidth: availableWidth,
                            columns: 4
                        )
                        // 2 Lignes de cellules + spacing entre les lignes + paddings haut/bas
                        let calculatedHeight = (cellSize * 2) + DesignSystem.Grid.spacing + (DesignSystem.Grid.padding * 2)
                        
                        DashboardGridView()
                            .frame(height: calculatedHeight)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .frame(height: 350)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .navigationDestination(for: DashboardDestination.self) { destination in
                destinationView(for: destination)
            }
        } // ← Fermeture du NavigationStack
    }
    
    @ViewBuilder
    private func destinationView(for destination: DashboardDestination) -> some View {
        switch destination {
        case .challenge:
            ChallengeView()
        case .books:
            BookcaseView()
        case .streak:
            StreakView()
        case .graph:
            StatisticsView()
        case .journal:
            PrivateJournalView()
        case .microphone:
            PrivateJournalView()
        case .jarChallenge:
            JarView()
        }
    }
}

#Preview {
    DashboardView()
}
