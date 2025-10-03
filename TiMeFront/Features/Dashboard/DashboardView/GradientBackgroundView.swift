//
//  GradientBackgroundView.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct GradientBackgroundView: View {
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                // Cercle 1 - Rose/Violet en haut à gauche
                Circle()
                    .fill(Color("PinkCustomClear"))
                    .frame(width: size.width * 0.8, height: size.width * 0.8)
                    .blur(radius: 100)
                    .offset(x: -size.width * 0.3, y: -size.height * 0.2)
                
                // Cercle 2 - Violet en bas à droite
                Circle()
                    .fill(Color("PurpleText").opacity(0.3))
                    .frame(width: size.width * 0.7, height: size.width * 0.7)
                    .blur(radius: 80)
                    .offset(x: size.width * 0.3, y: size.height * 0.4)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GradientBackgroundView()
}