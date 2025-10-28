//
//  MoodValidationCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct MoodValidationCardContent: View {
    
    let onValidate: () -> Void
    let onDelete: () -> Void
    let showSuccess: Bool
    let emotionTitle: String
    let categoryID: UUID?
    let backgroundColor: Color
    var buttonOffset: CGSize // Pour placer le bouton de validation
        
    init(
        onValidate: @escaping () -> Void,
        onDelete: @escaping () -> Void,
        showSuccess: Bool,
        emotionTitle: String,
        categoryID: UUID?,
        backgroundColor: Color,
        buttonOffset: CGSize = .zero // Valeur par défaut
    ) {
        self.onValidate = onValidate
        self.onDelete = onDelete
        self.showSuccess = showSuccess
        self.emotionTitle = emotionTitle
        self.categoryID = categoryID
        self.backgroundColor = backgroundColor
        self.buttonOffset = buttonOffset
    }
    
    private var buttonTintColor: Color {
        if showSuccess {
            return Color.green.opacity(0.75)
        } else {
            return backgroundColor
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background
            backgroundColor
                .allowsHitTesting(false)
            
            // Texte "Joyeuse"
            Text(emotionTitle)
                .font(.system(size: 12)
                    .width(.expanded)
                    .weight(.light))
                .foregroundStyle(Color("PurpleText"))
                .padding(.top, 5)
                .padding(.horizontal, 10)
        }
        .overlay(alignment: .bottomTrailing) {
            if #available(iOS 26.0, *) {
                Button(action: {
                    if showSuccess {
                        onDelete()
                    } else {
                        onValidate()
                    }
                }) {
                    Image(systemName: showSuccess ? "checkmark" : "plus")
                        .foregroundStyle(Color("PurpleText"))
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 36, height: 36)
                }
                .glassEffect(.regular.tint(buttonTintColor))
                .padding(.trailing, 6)
                .padding(.bottom, 6)
                .offset(buttonOffset)
            } else {
                Button(action: onValidate) {
                    Image(systemName: showSuccess ? "checkmark" : "plus")
                        .foregroundStyle(Color("PurpleText"))
                        .font(.system(size: 20, weight: .light))
                        .frame(width: 36, height: 36)
                }
                .background(showSuccess ? Color.green.opacity(0.2) : Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                .offset(buttonOffset)
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        // Joie (Orange)
        MoodValidationCardContent(
            onValidate: {},
            onDelete: {},
            showSuccess: false,
            emotionTitle: "Joyeuse",
            categoryID: UUID(uuidString: "CE85D2A7-EDD7-4F1B-8BEF-0486B6E8A043")!,
            backgroundColor: Color("OrangeCustomCard")
        )
        .frame(width: 150, height: 150)
        
        // Amour (Rose)
        MoodValidationCardContent(
            onValidate: {},
            onDelete: {},
            showSuccess: false,
            emotionTitle: "Amoureuse",
            categoryID: UUID(uuidString: "2406411A-717D-4543-B1D7-11491B517423")!,
            backgroundColor: Color("PinkCustomClear"),
            buttonOffset: .zero
        )
        .frame(width: 150, height: 150)
        
        // Validée
        MoodValidationCardContent(
            onValidate: {},
            onDelete: {},
            showSuccess: true,
            emotionTitle: "Sur un nuage",
            categoryID: UUID(uuidString: "CE85D2A7-EDD7-4F1B-8BEF-0486B6E8A043")!,
            backgroundColor: Color("OrangeCustomCard"),
            buttonOffset: .zero
        )
        .frame(width: 150, height: 150)
    }
}
