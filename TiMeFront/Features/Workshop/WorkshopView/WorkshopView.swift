//
//  WorkshopView.swift
//  TiMeFront
//
//  Created by Carla on 20/10/2025.
//

import SwiftUI

struct WorkshopView: View {
    
    var viewModel = WorkshopViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color.whitePurple
                    .ignoresSafeArea()
                
                VStack{
                    Text("Mon atelier")
                        .mediumPurple()
                        .padding(.top, 160)
                        .padding(.bottom, 5)
                    
                    Text("Classe les attributs dans ton ordre de priorité")
                        .semiBold()
                    
                    Spacer()
                    
                    VStack (alignment: .leading){
                        
                        ForEach(viewModel.workshopThemes, id: \.self) { theme in
                            
                            Text(theme)
                                .textCards()

                            HStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(height: 40)
                                    .foregroundStyle(.grayPurple)
                                    .overlay {
                                        Text(theme)
                                            .mediumBlack()
                                    }
                                DotView()
      
                            }
                        }.padding(.horizontal)
                        
                        
                    }
                    
                    Spacer()
                    
                    PurpleButton(withArrow: false, buttonFuncText: "Valider")
                        .padding(.bottom, 100)
                    
                    
                }.padding(.horizontal, 24)
                    .multilineTextAlignment(.center)
            }
        }

        
    }
}

#Preview {
    WorkshopView()
}
