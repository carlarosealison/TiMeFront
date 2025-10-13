//
//  MoodValidationCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct MoodValidationCardContent: View {
    
    let onValidate: () -> Void
    let showSuccess: Bool
    let emotionTitle: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background
            Color("OrangeCustom")
                .allowsHitTesting(false)
            
            // Texte "Joyeuse"
            Text(emotionTitle)
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
                    Image(systemName: showSuccess ? "checkmark" : "plus")
                        .foregroundStyle(Color("PurpleText"))
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 36, height: 36)
                }
                .glassEffect(.regular.tint(showSuccess ? Color.green.opacity(0.75) : Color("OrangeCustom")))
                .padding(.trailing, 6)
                .padding(.bottom, 6)
                .disabled(showSuccess)
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
                .disabled(showSuccess)
            }
        }
    }
}

#Preview {
    VStack {
        MoodValidationCardContent(onValidate: {}, showSuccess: false, emotionTitle: "")
            .frame(width: 150, height: 150)
        
        MoodValidationCardContent(onValidate: {}, showSuccess: true, emotionTitle: "")
            .frame(width: 150, height: 150)
    }
}
