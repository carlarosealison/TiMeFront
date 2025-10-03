//
//  GradientBackgroundView.swift
//  TiMeFront
//
//  Created by Thibault on 03/10/2025.
//

import SwiftUI

struct GradientBackgroundView: View {
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                // Cercle 1
                Circle()
                    .fill(Color("PinkBackground").opacity(0.6))
                    .frame(width: size.width * 1, height: size.width * 1)
                    .blur(radius: 90)
                    .offset(x: -size.width * 0.55, y: -size.height * -0.2)
                
                // Cercle 2
                Circle()
                    .fill(Color("BlueBackground").opacity(0.6))
                    .frame(width: size.width * 1, height: size.width * 1.0)
                    .blur(radius: 90)
                    .offset(x: size.width * 0.3, y: size.height * 0.5)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GradientBackgroundView()
}
