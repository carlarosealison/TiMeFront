//
//  ViewGlassEffect.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func glassEffectIfAvailable(cornerRadius: CGFloat = 15) -> some View {
        if #available(iOS 26.0, *) {
            self.glassEffect(.regular.tint(.white.opacity(0.2)), in: .rect(cornerRadius: cornerRadius))
        } else {
            self.background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white.opacity(0.6))
            )
        }
    }
}
