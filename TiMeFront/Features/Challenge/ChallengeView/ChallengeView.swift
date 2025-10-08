//
//  ChallengeView.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import SwiftUI

struct ChallengeView: View {
    
    let challenge : ChallengeModel
    var viewModel = ChallengeViewModel()
    var body: some View {
        NavigationStack{
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
                    
                    Text(challenge.instruction)
                        .foregroundStyle(.purpleText)
                        .font(.system(size: 24).width(.expanded).weight(.semibold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    PurpleButton(withArrow: true, buttonFuncText: "Allons-y!")
                        .padding(.bottom, 100)
                    
                }.frame(width: 360)
                    .onAppear {
                        Task {
                            do{
                                try await viewModel.fetchIndexChallenge()
                            }
                            catch{
                                print("Error in fetching while fetching the challenge : \(error.localizedDescription)")
                            }
                        }
                        
                    }
  
            }
        }
        
    }
}

#Preview {
    ChallengeView(challenge: .init(id: .init(), instruction: "vrvr", messageMotivation: ""))
}
