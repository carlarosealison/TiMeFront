//
//  DailyStatementView.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//

import SwiftUI

struct DailyStatementView: View {
    @State private var viewModel = StatementViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView()
            } else if let statement = viewModel.dailyStatement {
                VStack(spacing: 8) {
                    Text("Citation du jour")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(statement.sentence)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("PurpleText"))
                        .padding()
                }
                .padding(.horizontal)
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .task {
            await viewModel.fetchDailyStatement()
        }
    }
}
