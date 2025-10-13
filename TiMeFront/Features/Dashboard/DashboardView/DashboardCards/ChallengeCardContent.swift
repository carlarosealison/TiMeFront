//
//  ChallengeCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct ChallengeCardContent: View {
    
    let title: String
    let description: String
    
    var challengeIsValidate = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .fontWidth(.expanded)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("PurpleText"))
                
                Text(description)
                    .fontWidth(.expanded)
                    .fontWeight(.light)
                    .foregroundStyle(.primary)
                    .lineLimit(4)
                
                Spacer(minLength: 0)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .overlay(alignment: .bottomTrailing) {
            if #available(iOS 26.0, *) {
                Button(action: {}) {
                    Image(systemName: "checkmark.square.fill")
                        .font(.title2)
                        .foregroundStyle(Color("PurpleText"))
                }
            }
        }
    }
}

#Preview {
    DashboardCard {
        ChallengeCardContent(
            title: "Défi",
            description: "Prend du temps pour toi en t'appliquant un soin du visage"
        )
    }
    .frame(width: 300, height: 300)
}
