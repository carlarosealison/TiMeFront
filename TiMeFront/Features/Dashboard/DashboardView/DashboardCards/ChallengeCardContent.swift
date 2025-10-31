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
    let showSuccess: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(showSuccess ? "Défi réussi !" : title)
                    .font(.system(size: 14))
                    .fontWidth(.expanded)
                    .fontWeight(.semibold)
                    .foregroundStyle(showSuccess ? .white : Color("PurpleText"))
                
                Spacer()
                
                Text(description)
                    .font(.system(size: 12))
                    .fontWidth(.expanded)
                    .fontWeight(.light)
                    .lineLimit(5)
                    .minimumScaleFactor(0.8)
                    .multilineTextAlignment(.leading)
                
                Spacer(minLength: 0)
            }
            .padding(12)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .overlay(alignment: .topTrailing) {
            if showSuccess {
                ZStack {
                    Circle()
                        .fill(Color("PurpleCardButton"))
                        .frame(width: 32, height: 32)
                    
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(12)
            }
        }
        .background(
            showSuccess ? Color("PurpleCard") : Color(.white)
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        DashboardCard {
            ChallengeCardContent(
                title: "Défi",
                description: "Prend du temps pour toi en t'appliquant un soin du visage",
                showSuccess: false
            )
        }
        .frame(width: 300, height: 300)
        
        DashboardCard {
            ChallengeCardContent(
                title: "Défi",
                description: "Prend du temps pour toi en t'appliquant un soin du visage",
                showSuccess: true
            )
        }
        .frame(width: 300, height: 300)
    }
}
