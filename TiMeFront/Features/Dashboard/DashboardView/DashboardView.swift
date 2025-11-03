    //
    //  DashboardView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 26/09/2025.
    //

import SwiftUI
import CoreMotion

@available(iOS 26.0, *)
struct DashboardView: View {
    @State private var navigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                GradientBackgroundView()
                
                VStack {
                    DashboardHeaderView()
                    
                    Spacer()
                    
                    DailyStatementView()
                    
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
        }
    }
    
    @ViewBuilder
    private func destinationView(for destination: DashboardDestination) -> some View {
        switch destination {
            case .challenge:
                ChallengeView(navigationPath: $navigationPath)
            case .books:
                BookcaseView()
            case .streak:
                StreakView()
            case .graph:
                StatisticsView()
            case .journal:
            JournalEditorView(viewModel: .constant(JournalEditorViewModel()))
            case .microphone:
                RecordView()
            case .jarChallenge:
                JarView(navigationPath: $navigationPath)
            case .profile:
                ProfilView()
            case .privateJournal(let weekNumber, let month, let year):
                PrivateJournalWeekView(
                    weekNumber: weekNumber,
                    month: month,
                    year: year
                )
        }
    }
}

#Preview {
        let previewBookColor: BookColor = .purple

    if #available(iOS 26.0, *) {
        DashboardView()
            .environment(AuthViewModel())

            .environment(ChallengeViewModel())
    }
    }
