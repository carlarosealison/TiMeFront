//
//  MoodValidationCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct MoodValidationCardContent: View {
    
    let onValidate: () -> Void
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background
            Color("PinkCustomClear")
                .allowsHitTesting(false)
            
            // Texte "Joyeuse"
            Text("Joyeuse")
                .font(.system(size: 12)
                    .width(.expanded)
                    .weight(.light))
                .foregroundStyle(Color("PurpleText"))
                .padding(.top, 10)
                .padding(.leading, 8)
        }
        .overlay(alignment: .bottomTrailing) {
            if #available(iOS 26.0, *) {
                Button(action: onValidate) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color("PurpleText"))
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 36, height: 36)
                }
                .glassEffect(.regular.tint(Color("PinkCustomMate")))
                .padding(.trailing, 6)
                .padding(.bottom, 6)
            } else {
                Button(action: onValidate) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color("PurpleText"))
                        .font(.system(size: 20, weight: .light))
                        .frame(width: 36, height: 36)
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 10)
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    MoodValidationCardContent(onValidate: {})
        .frame(width: 150, height: 150)
}
