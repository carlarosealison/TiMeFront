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
        VStack {
            Image(systemName: "book.pages")
                .font(.system(size: 32, weight: .semibold))
                .foregroundStyle(Color("PurpleDark"))
            
            Text(title)
                .font(.system(size: 12)
                    .width(.expanded)
                    .weight(.light))
        }
        .frame(maxWidth: .infinity)
        .background(
            Image("BackgroundDots")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 500)
        )
    }
}

#Preview {
    DashboardCard(span: .wide) {
        JournalCardContent(title: "Rédaction du jour")
    }
    .frame(width: 320, height: 150)
}
