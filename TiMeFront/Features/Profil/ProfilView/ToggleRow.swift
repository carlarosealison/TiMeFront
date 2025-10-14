//
//  ToggleRow.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import SwiftUI

struct ToggleRow: View {
    var icon: String
    var text: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
                .foregroundColor(Color("PurpleText"))
            Text(text)
                .foregroundColor(Color("PurpleText"))
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
            
        }
        .padding()
        .background(Color.white.opacity(0.1))
    }
}
#Preview("ToggleRow") {
    @Previewable @State var isOn = true
    return ToggleRow(icon: "bell.fill", text: "Notifications", isOn: $isOn)
        .padding()
        .background(Color(.systemBackground))
}
