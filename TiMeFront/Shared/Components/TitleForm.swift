//
//  TitleForm.swift
//  TiMeFront
//
//  Created by apprenant152 on 01/10/2025.
//

import SwiftUI

struct TitleForm: View {
    let title: String
    var isWelcome: Bool
    var body: some View {
        Text(title)
            .font(.system(size: isWelcome ? 48 : 36).width(.expanded).weight(.black))
            .foregroundStyle(.purpleText)
    }
}

#Preview {
    TitleForm(title: "Inscription", isWelcome: false)
}
