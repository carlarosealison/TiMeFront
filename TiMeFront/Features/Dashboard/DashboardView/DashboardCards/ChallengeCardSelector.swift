//
//  ChallengeCardSelector.swift
//  TiMeFront
//
//  Created by Thibault on 14/10/2025.
//

import SwiftUI

/// Affiche soit le bocal de challenges, soit la carte du défi en cours, soit la carte du défi validé selon l'état du ChallengeViewModel
struct ChallengeCardSelector: View {
    
    @Bindable var challengeViewModel: ChallengeViewModel
    let cellSize: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        let cardFrame = DesignSystem.Grid.cardSize(cells: 2, cellSize: cellSize, spacing: spacing)
        
        if challengeViewModel.challenge == nil {
            // Aucun challenge accepté → Afficher le bocal
            jarCardView(cardFrame: cardFrame)
        } else {
            // Challenge accepté → Afficher la carte de défi
            challengeActiveCardView(cardFrame: cardFrame)
        }
    }
    
    // MARK: - Bocal de challenges
    private func jarCardView(cardFrame: CGFloat) -> some View {
        NavigationLink(value: DashboardDestination.jarChallenge) {
            DashboardCard {
                ChallengeJarCardContent()
            }
            .frame(width: cardFrame, height: cardFrame)
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
        .transition(.scale.combined(with: .opacity))
    }
    
    // MARK: - Carte de défi en cours
    private func challengeActiveCardView(cardFrame: CGFloat) -> some View {
        NavigationLink(value: DashboardDestination.challenge) {
            DashboardCard {
                ChallengeCardContent(
                    title: "Défi",
                    description: challengeViewModel.challenge?.instruction ?? "Prend du temps pour toi",
                    showSuccess: challengeViewModel.isChallengeCompleted
                )
            }
            .frame(width: cardFrame, height: cardFrame)
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
        .transition(.scale.combined(with: .opacity))
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        // Preview avec bocal (pas de challenge)
        ChallengeCardSelector(
            challengeViewModel: {
                let vm = ChallengeViewModel()
                vm.challenge = nil
                return vm
            }(),
            cellSize: 100,
            spacing: 8
        )
        
        // Preview du challenge en cours (non complété)
        ChallengeCardSelector(
            challengeViewModel: {
                let vm = ChallengeViewModel()
                vm.challenge = ChallengeModel(
                    id: UUID(),
                    instruction: "Prend du temps pour toi en t'appliquant un soin du visage",
                    messageMotivation: "Tu peux le faire !"
                )
                vm.isChallengeCompleted = false
                return vm
            }(),
            cellSize: 100,
            spacing: 8
        )
        
        // Preview du challenge validé
        ChallengeCardSelector(
            challengeViewModel: {
                let vm = ChallengeViewModel()
                vm.challenge = ChallengeModel(
                    id: UUID(),
                    instruction: "Prend du temps pour toi en t'appliquant un soin du visage",
                    messageMotivation: "Bravo !"
                )
                vm.isChallengeCompleted = true
                return vm
            }(),
            cellSize: 100,
            spacing: 8
        )
    }
    .padding()
}
