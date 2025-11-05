    //
    //  ShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

    /// Une étagère
struct ShelfView: View {
    var width: CGFloat = 350
    var height: CGFloat = 12
    var shadowRadius: CGFloat = 15
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [Color(.purpleButton)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: width, height: height)
            .overlay {
                Rectangle()
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            }
            .shadow(
                color: .black.opacity(0.7),
                radius: shadowRadius,
                x: 0,
                y: 10
            )
            .cornerRadius(100)
    }
}

#Preview {
    VStack(spacing: 40) {
        ShelfView()
        ShelfView(width: 200, height: 12, shadowRadius: 20)
    }
    .padding()
}
