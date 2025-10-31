//
//  BookView.swift
//  TiMeFront
//
//  Created by Thibault on 30/10/2025.
//

import SwiftUI

/// Vue d'un livre individuel (composant de présentation pur)
struct BookView: View {
    let book: Book
    
    var body: some View {
        VStack(spacing: 8) {
            // Image du livre
            Image("PurpleBook")
                .resizable()
                .scaledToFit()
                .frame(height: 160)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            
            // Titre
            Text("Semaine \(book.weekNumber)")
                .font(.system(size: 12))
                .fontWidth(.expanded)
                .fontWeight(.medium)
                .foregroundStyle(Color("PurpleText"))
        }
        .frame(width: 120)
    }
}

#Preview {
    BookView(book: Book(weekNumber: 1, month: 10, year: 2025))
}