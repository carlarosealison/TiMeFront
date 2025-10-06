//
//  ChallengeView.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import SwiftUI

struct ChallengeView: View {
//    func challenge(rules: String) -> any View{
//        Text(rules)
//            .foregroundStyle(.purpleDarkHover)
//            .font(.system(size: 24).width(.expanded).weight(.semibold))
//    }
    
    var viewModel = ChallengeViewModel()
    var body: some View {
        ZStack {
            Color.whitePurple
                .ignoresSafeArea()
            VStack {
                Spacer(minLength: 300)
                
                Text("Défi du jour")
                    .foregroundStyle(.purpleDarkHover)
                    .font(.system(size: 20).width(.expanded).weight(.medium))
                    .padding(5)
                    .frame(width: 300)
                if let challenge = viewModel.challenge {
                    Text(challenge.instruction)
                        .foregroundStyle(.purpleText)
                        .font(.system(size: 24).width(.expanded).weight(.semibold))
                        .multilineTextAlignment(.center)
                }

                Spacer()
                
                PurpleButton(withArrow: true, buttonFuncText: "Allons-y!")
                    .padding(.bottom, 100)
            
            }.frame(width: 360)
            
            
            
            
        }
    }
}

#Preview {
    ChallengeView()
}
