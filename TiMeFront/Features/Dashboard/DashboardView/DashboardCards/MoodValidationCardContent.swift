//
//  MoodValidationCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct MoodValidationCardContent: View {
    
    let onValidate: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Joyeuse")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.pink)
            
            Button(action: onValidate) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(Color("PurpleDark"))
                    .frame(width: 50, height: 50)
                    .background(Color.pink.opacity(0.2))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink.opacity(0.1))
    }
}