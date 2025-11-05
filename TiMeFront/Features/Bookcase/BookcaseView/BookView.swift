    //
    //  BookView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

    /// Vue d'un livre individuel
struct BookView: View {
    let book: Book
    let showInitials: Bool
    
    @Environment(AuthViewModel.self) private var authViewModel
    
    init(book: Book, showInitials: Bool = false) {
        self.book = book
        self.showInitials = showInitials
    }
    
    var body: some View {
        ZStack {
            Image(book.color.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .overlay(alignment: .topTrailing) {
                        // Numéro de semaine
                    Text("\(book.weekNumber)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(book.color.textColor)
                        .padding(.top, 45)
                        .padding(.trailing, 12)
                }
                .overlay(alignment: .bottom) {
                        // Initiales
                    if showInitials {
                        Text(authViewModel.userInitials)
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundStyle(book.color.textColor)
                            .padding(.bottom, 12)
                    }
                }
                .rotationEffect(book.placement.rotation, anchor: .center)
                .scaleEffect(book.placement.scale, anchor: .center)
        }
        .frame(width: 180, height: 180)
    }
}

    // MARK: - Couleur des livres

enum BookColor: CaseIterable {
    case button, gray, pink, purple, purpleDark
    
    var imageName: String {
        switch self {
            case .button: return "ButtonBooks"
            case .gray: return "GrayBook"
            case .pink: return "PinkBook"
            case .purple: return "PurpleBook"
            case .purpleDark: return "PurpleDarkBook"
        }
    }
    
    var textColor: Color {
        switch self {
            case .pink, .purple, .purpleDark:
                return Color("WhitePurple")
            case .button, .gray:
                return Color("PurpleDark")
        }
    }
}

    // MARK: - Preview

#Preview("Positionnement du texte") {
    @Previewable @State var mockAuth = AuthViewModel()
    
    mockAuth.currentUser = UserResponse(
        id: UUID(),
        firstName: "Alice",
        lastName: "Dupont",
        userName: "alice_d",
        email: "alice@test.com",
        imageProfil: nil,
        streakNumber: 5,
        challengeNumber: 3
    )
    mockAuth.isAuthenticated = true
    
    return ScrollView {
        VStack(spacing: 40) {
            Text("Numéro haut-droite, Initiales bas-centré")
                .font(.headline)
            
                // Livres verticaux
            HStack(spacing: 20) {
                BookView(
                    book: Book(
                        weekNumber: 1,
                        month: 11,
                        year: 2025,
                        placement: .init(offset: .zero, rotation: .degrees(0), scale: 1.0)
                    ),
                    showInitials: true
                )
                
                BookView(
                    book: Book(
                        weekNumber: 2,
                        month: 11,
                        year: 2025,
                        placement: .init(offset: .zero, rotation: .degrees(0), scale: 0.85)
                    ),
                    showInitials: true
                )
            }
            
                // Livres horizontaux
            HStack(spacing: 20) {
                BookView(
                    book: Book(
                        weekNumber: 3,
                        month: 11,
                        year: 2025,
                        placement: .init(offset: .zero, rotation: .degrees(90), scale: 0.95)
                    ),
                    showInitials: true
                )
                
                BookView(
                    book: Book(
                        weekNumber: 4,
                        month: 11,
                        year: 2025,
                        placement: .init(offset: .zero, rotation: .degrees(90), scale: 0.8)
                    ),
                    showInitials: true
                )
            }
            
                // Livres inclinés
            HStack(spacing: 20) {
                BookView(
                    book: Book(
                        weekNumber: 5,
                        month: 11,
                        year: 2025,
                        placement: .init(offset: .zero, rotation: .degrees(-25), scale: 0.9)
                    ),
                    showInitials: true
                )
            }
        }
        .padding()
    }
    .environment(mockAuth)
}
