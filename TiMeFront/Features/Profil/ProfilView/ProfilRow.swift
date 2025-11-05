    //
    //  ProfilRow.swift
    //  TiMeFront
    //
    //  Created by Mounir on 13/10/2025.
    //

import SwiftUI

struct ProfilRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .symbolVariant(.fill)
                .fontWidth(.expanded)
                .foregroundColor(Color("PurpleText"))
                .frame(width: 36)
            
            Text(text)
                .fontWidth(.expanded)
                .foregroundColor(Color("PurpleText"))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("PurpleText"))
        }
        .padding()
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.2)),
            alignment: .bottom
        )
    }
}
#Preview {
    ProfilRow(icon: "person.crop.circle.fill", text: "Account")
}
