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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color("PurpleText"))
            
            Text(description)
                .font(.body)
                .foregroundStyle(.primary)
                .lineLimit(4)
            
            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
