//
//  ExerciseCardView.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: ExerciseResponse
    
    var body: some View {
        HStack(spacing: 16) {
            // Image de l'exercice
            AsyncImage(url: URL(string: exercise.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            } placeholder: {
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("PurpleText"))
            }
            
            // Instruction
            VStack(alignment: .leading, spacing: 4) {
                Text("Exercice du jour")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(exercise.instruction)
                    .font(.body)
                    .foregroundColor(Color("PurpleText"))
                    .lineLimit(2)
            }
        }
        .padding()
    }
}

#Preview {
    ExerciseCardView(
        exercise: ExerciseResponse(
            id: UUID(),
            instruction: "Classe les attributs dans ton ordre de priorité",
            image: "https://cdn3.iconfinder.com/data/icons/knowledge-management-glyph-2/64/intellectual-brain-intelligent-guru-sage-pundit-1024.png",
            challengeID: nil
        )
    )
}
