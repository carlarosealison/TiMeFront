//
//  GridCardDataView.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct GridCardDataView: View {
    var pages: Int
    var streak: Int
    var notes: Int
    var challengeSuccessful: Int

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: 61, description: "Motivation moyenne", size: .medium, dataSize: .medium)
                    )
                )
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: challengeSuccessful, description: "Défi réussi", size: .mediumLarge, dataSize: .medium)
                    )
                )
            }

            HStack(alignment: .top, spacing: 12) {
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: notes, description: "Rédaction", size: .large, dataSize: .large)
                    )
                )
                VStack(spacing: 12) {
                    CardDataCell(
                        cardVM: StatisticsCardViewModel(
                            card: Card(data: streak, description: "Streak", size: .small, dataSize: .medium)
                        )
                    )
                    CardDataCell(
                        cardVM: StatisticsCardViewModel(
                            card: Card(data: pages, description: "Pages", size: .small, dataSize: .medium)
                        )
                    )
                }
            }
        }
        .padding()
    }
}


#Preview {
    GridCardDataView(pages: 10, streak: 4, notes: 104, challengeSuccessful: 8)
}


