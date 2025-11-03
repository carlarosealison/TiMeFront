//
//  SlideToValidate.swift
//  TiMeFront
//
//  Created by Thibault on 24/10/2025.
//

import SwiftUI

struct SlideToValidate: View {
    @Binding var isValidated: Bool
    let onValidate: () -> Void
    
    // Personnalisation des couleurs
    var trackColor: Color = Color.greenCustom.mix(with: .white, by: 0.55)
    var buttonColor: Color = .whitePurple
    var iconColor: Color = .greenCustom
    var textColor: Color = Color.greenCustom.mix(with: .gray, by: 0.3)
    
    @State private var offsetX: CGFloat = 0
    @State private var isSliding: Bool = false
    
    private let buttonSize: CGFloat = 70
    private let trackHeight: CGFloat = 80
    private var maxSlideDistance: CGFloat {
        UIScreen.main.bounds.width - 90 - buttonSize
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background
            RoundedRectangle(cornerRadius: 90)
                .frame(height: trackHeight)
                .foregroundStyle(trackColor)
                .overlay {
                    HStack {
                        Spacer()
                        Text(isSliding ? "Continuez..." : "Glisser pour valider")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .fontWidth(.expanded)
                            .foregroundStyle(textColor)
                            .opacity(1 - Double(offsetX / maxSlideDistance) * 0.7)
                        Spacer()
                    }
                    .padding(.leading, buttonSize + 20)
                }
            
            // Slider
            Circle()
                .foregroundStyle(buttonColor)
                .frame(width: buttonSize, height: buttonSize)
                .overlay {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 30))
                        .foregroundStyle(iconColor)
                        .opacity(isSliding ? 0.6 : 1.0)
                }
                .offset(x: offsetX + 5)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isSliding = true
                            // Limite le drag entre 0 et maxSlideDistance
                            let newOffset = max(0, min(value.translation.width, maxSlideDistance))
                            offsetX = newOffset
                        }
                        .onEnded { _ in
                            isSliding = false
                            // Si on a glissé 100%, on valide
                            if offsetX == maxSlideDistance * 1 {
                                withAnimation(.spring(response: 0.3)) {
                                    offsetX = maxSlideDistance
                                }
                                    isValidated = true
                                    onValidate()
                            } else {
                                // Sinon on revient au début
                                withAnimation(.spring(response: 0.3)) {
                                    offsetX = 0
                                }
                            }
                        }
                )
                .animation(.spring(response: 0.3), value: offsetX)
        }
        .padding(.horizontal, 45)
    }
}

#Preview {
    @Previewable @State var isValidated = false
    
    ZStack {
        Color.whitePurple
            .ignoresSafeArea()
        
        VStack(spacing: 40) {
            SlideToValidate(isValidated: $isValidated) {
                print("Challenge validé!")
            }
        }
    }
}
