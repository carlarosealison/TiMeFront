//
//  ChallengeView.swift
//  TiMeFront
//
//  Created by Carla on 25/09/2025.
//

import SwiftUI

struct ChallengeView: View {
    
    @State var viewModel = ChallengeOfTheDayViewModel(authViewModel: AuthViewModel())
    
    var body: some View {
        
        VStack {
                ZStack {
                    Color.whitePurple
                        .ignoresSafeArea()
                    VStack {
                        Spacer(minLength: 265)
                        
                        Text("Défi du jour")
                            .mediumPurple()
                            .padding(5)
                        
                        Text(viewModel.challenge?.instruction ?? "challenge indisponible")
                            .semiBold()
                            .multilineTextAlignment(.center)
                        
                        
                        Spacer()
                        
                        PurpleButton(withArrow: true, buttonFuncText: "Allons-y!")
                            .padding(.bottom, 100)
                        
                    }
                    .padding(.horizontal, 24)
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            NavigationLink {
                                //TODO: mettre en place un navigation path pour pop sur le dashborad
                                
                            } label: {
                                Text("Passer")
                                    .foregroundStyle(.purpleText)
                                    .fontWeight(.regular)
                                    .fontWidth(.expanded)
                                    .underline()
                            }
                            
                        }
                    }
                    
                    
                }
                .task {
                    do{
                        try await viewModel.fetchRandomChallengeOfTheDay()
                    }
                    catch{
                        print("Error while fetching the challenge : \(error.localizedDescription)")
                    }
                    
                }
                
        }
    }

    }


#Preview {
    ChallengeView()
}
