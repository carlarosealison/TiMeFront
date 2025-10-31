    //
    //  BookView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 30/10/2025.
    //

import SwiftUI

    /// Vue d'un livre individuel
struct BookView: View {
    let book: Book
    
    var body: some View {
        VStack(spacing: 8) {
                // La couleur vient automatiquement de book.color
            Image(book.color.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 160)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            
            Text("Semaine \(book.weekNumber)")
                .font(.system(size: 10))
                .fontWidth(.expanded)
                .fontWeight(.medium)
                .foregroundStyle(Color("PurpleText"))
                .opacity(0.7)
        }
        .frame(width: 120)
    }
}

    // MARK: - BookColor Enum

enum BookColor: CaseIterable {
    case button
    case gray
    case orange
    case pink
    case purple
    case purpleDark
    case yellow
    
    var imageName: String {
        switch self {
            case .button: return "ButtonBooks"
            case .gray: return "GrayBook"
            case .orange: return "OrangeBook"
            case .pink: return "PinkBook"
            case .purple: return "PurpleBook"
            case .purpleDark: return "PurpleDarkBook"
            case .yellow: return "YellowBook"
        }
    }
}

    // MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        BookView(book: Book(weekNumber: 1, month: 10, year: 2025))
        BookView(book: Book(weekNumber: 2, month: 10, year: 2025))
        BookView(book: Book(weekNumber: 3, month: 10, year: 2025))
        BookView(book: Book(weekNumber: 4, month: 10, year: 2025))
    }
    .padding()
    .background(Color.whitePurple)
}
