//
//  ChallengeView.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import SwiftUI

struct ChallengeView: View {
    
//    let challenge : ChallengeModel
    var viewModel = ChallengeViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color.whitePurple
                    .ignoresSafeArea()
                VStack {
                    Spacer(minLength: 265)
                    
                    Text("Défi du jour")
                        .foregroundStyle(.purpleDarkHover)
                        .font(.system(size: 20).width(.expanded).weight(.medium))
                        .padding(5)
                    
                    Text(viewModel.challenge?.instruction ?? "challenge indisponible")
                        .foregroundStyle(.purpleText)
                        .font(.system(size: 24).width(.expanded).weight(.semibold))
                        .multilineTextAlignment(.center)
                        
                    
                    Spacer()
                    
                    PurpleButton(withArrow: true, buttonFuncText: "Allons-y!")
                        .padding(.bottom, 100)
                    
                }.frame(width: 360)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            NavigationLink { //ici mettre en place un navigation path pour pop sur le dashborad
//                                DashboardView()
                                
                            } label: {
                                Text("Skip")
                                    .foregroundStyle(.purpleText)
                                    .fontWeight(.regular)
                                    .fontWidth(.expanded)
                                    .underline()
                                    
                            }

                        }
                    }
                    .onAppear {
                        Task {
                            do{
                                try await viewModel.fetchRandomChallenge()
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
    ChallengeView()
}
