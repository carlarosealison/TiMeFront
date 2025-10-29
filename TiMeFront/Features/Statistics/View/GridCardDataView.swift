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
    var average: Int
    var challengeSuccessful: Int

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: average, description: "Motivation moyenne", size: .medium, dataSize: .medium, descriptionFontSize: .small)
                    )
                )
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: challengeSuccessful, description: "Défi réussi", size: .mediumLarge, dataSize: .medium, descriptionFontSize: .small)
                    )
                )
            }

            HStack(alignment: .top, spacing: 12) {
                CardDataCell(
                    cardVM: StatisticsCardViewModel(
                        card: Card(data: notes, description: "Rédaction", size: .large, dataSize: .large, descriptionFontSize: .medium)
                    )
                )
                VStack(spacing: 12) {
                    CardDataCell(
                        cardVM: StatisticsCardViewModel(
                            card: Card(data: streak, description: "Streak", size: .small, dataSize: .medium, descriptionFontSize: .small)
                        )
                    )
                    CardDataCell(
                        cardVM: StatisticsCardViewModel(
                            card: Card(data: pages, description: "Pages", size: .small, dataSize: .medium, descriptionFontSize: .small)
                        )
                    )
                }
            }
        }
        .padding()
    }
}


#Preview {
    GridCardDataView(pages: 10, streak: 4, notes: 104, average: 65, challengeSuccessful: 8)
}


