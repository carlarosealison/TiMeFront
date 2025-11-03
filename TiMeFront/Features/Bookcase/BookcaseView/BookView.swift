    //
    //  BookView.swift
    //  TiMeFront
    //

import SwiftUI

    /// Vue d'un livre individuel
struct BookView: View {
    let book: Book
    
    var body: some View {
        Image(book.color.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 150)
            .rotationEffect(book.placement.rotation)
            .scaleEffect(book.placement.scale)
            .frame(width: 150, height: 150)
    }
}

    // MARK: - Couleur des livres depuis les assets

enum BookColor: CaseIterable {
    case button
    case gray
    case pink
    case purple
    case purpleDark
    
    var imageName: String {
        switch self {
            case .button: return "ButtonBooks"
            case .gray: return "GrayBook"
            case .pink: return "PinkBook"
            case .purple: return "PurpleBook"
            case .purpleDark: return "PurpleDarkBook"
        }
    }
}

    // MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        BookView(book: Book(
            weekNumber: 1,
            month: 10,
            year: 2025,
            placement: .default
        ))
        BookView(book: Book(
            weekNumber: 2,
            month: 10,
            year: 2025,
            placement: .default
        ))
    }
    .padding()
}
