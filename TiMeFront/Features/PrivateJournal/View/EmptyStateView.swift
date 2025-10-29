//
//  EmptyStateView.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

struct EmptyStateView: View {
    let date: Date
    let onCreateEntry: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            // Icône
            Image(systemName: "book.closed")
                .font(.system(size: 60))
                .foregroundStyle(.gray.opacity(0.5))
            
            // Texte
            VStack(spacing: 8) {
                Text("Aucune donnée")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("PurpleText"))
                
                Text("Commence ton journal pour ce jour")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            
            // Bouton
            Button(action: onCreateEntry) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Créer une entrée")
                }
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color("PurpleButton"))
                .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.5))
    }
}

#Preview {
    EmptyStateView(date: Date(), onCreateEntry: {
        print("Créer entrée")
    })
}
