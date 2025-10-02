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
    var body: some View {
        ZStack {
            Color.whitePurple
                .ignoresSafeArea()
            VStack {
//                Spacer()
                
                Text("Défi du jour")
                    .foregroundStyle(.purpleDarkHover)
                    .font(.system(size: 20).width(.expanded).weight(.medium))
                    .padding(5)
                    .frame(width: 300)
                
                Text("Engager une discussion avec une amie")
                    .foregroundStyle(.purpleText)
                    .font(.system(size: 24).width(.expanded).weight(.semibold))
                    .multilineTextAlignment(.center)
                
//                Spacer(minLength: 400)
            }.frame(width: 360)
            
            
            
            
        }
    }
}

#Preview {
    ChallengeView()
}
