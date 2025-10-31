//
//  ShelfView.swift
//  TiMeFront
//
//  Created by Thibault on 30/10/2025.
//


//
//  ShelfView.swift
//  TiMeFront
//

import SwiftUI

/// Une étagère en bois (la planche horizontale)
struct ShelfView: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 0.6, green: 0.4, blue: 0.2),
                        Color(red: 0.5, green: 0.3, blue: 0.15)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 15)
            .overlay {
                // Effet bois
                Rectangle()
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            }
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}