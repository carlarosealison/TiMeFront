//
//  DailyExerciseView.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//

import SwiftUI

struct DailyExerciseView: View {
    @State private var viewModel = ExerciseViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView()
            } else if let exercise = viewModel.randomExercise {
                ExerciseCardView(exercise: exercise)
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .task {
            await viewModel.fetchRandomExercise()
        }
    }
}

#Preview {
    DailyExerciseView()
}
