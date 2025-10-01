//
//  ImageTestView.swift
//  TiMeFront
//
//  Created by apprenant152 on 01/10/2025.
//

import SwiftUI

struct ImageTestView: View {
    var body: some View {
        Image("StreakSmall")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageTestView()
}
