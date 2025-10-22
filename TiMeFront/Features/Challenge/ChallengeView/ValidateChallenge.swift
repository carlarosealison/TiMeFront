//
//  ValidateChallenge.swift
//  TiMeFront
//
//  Created by Apprenant125 on 21/10/2025.
//

import SwiftUI

struct ValidateChallenge: View {
    var body: some View {
        ZStack {
            Color.greenCustom
                .ignoresSafeArea()
            VStack {
                Text("Valider ce challenge?")
                    .boldTextWhite()
                    .padding(40)
                
                
                
                RoundedRectangle(cornerRadius: 90)
                    .frame(height: 60)
                    .foregroundStyle(.greenCustom.mix(with: .white, by: 0.55))
                    .overlay(content: {
                        Text("Valider")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .fontWidth(.expanded)
                            .foregroundStyle(.greenCustom.mix(with: .gray, by: 0.3))
                    })
                    .overlay (alignment: .leading){
                        Circle()
                            .foregroundStyle(.whitePurple)
                            .overlay {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.greenCustom)
                            }
                        
                    }
                    .padding(.horizontal, 45)
            }
            
            
            
            
        }
        
    }
}

#Preview {
    ValidateChallenge()
}
