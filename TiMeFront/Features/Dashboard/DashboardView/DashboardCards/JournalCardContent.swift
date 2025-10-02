//
//  JournalCardContent.swift
//  TiMeFront
//
//  Created by Thibault on 30/09/2025.
//

import SwiftUI

struct JournalCardContent: View {
    
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "doc.text.fill")
                .font(.system(size: 32, weight: .semibold))
                .foregroundStyle(Color("PurpleText"))
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    DashboardCard(span: .wide) {
        JournalCardContent(title: "Rédaction du jour")
    }
    .frame(width: 320, height: 150)
    .padding()
}