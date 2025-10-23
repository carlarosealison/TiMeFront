//
//  JournalEditorView.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import SwiftUI

struct JournalEditorView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image(.backgroundBullet)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Émotion")
                        .semiBold()
                    
                    if #available(iOS 26.0, *) {
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(in: .rect(cornerRadius: 20))
                            .frame(width: 160 ,height: 150)
                            .foregroundStyle(.white)
                        //                            .shadow(radius: 3, y: 4)
                            .overlay {
                                VStack (alignment: .leading){
                                    Image(systemName: "heart")
                                    //                                    .resizable()
                                    //                                    .aspectRatio(0.7, contentMode: .fit)
                                        .font(.system(size: 70))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.purpleButton)
                                    Text("Niveau d'émotion")
                                        .font(.system(size: 14))
                                        .fontWeight(.thin)
                                        .fontWidth(.expanded)
                                    Text("Remplissez le selon votre ressenti")
                                        .font(.system(size: 8))
                                        .fontWeight(.thin)
                                        .fontWidth(.expanded)
                                }.padding(.leading, 5)
                                
                            }
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 160 ,height: 150)
                            .foregroundStyle(.white)
                        overlay {
                            Image(systemName: "heart")
                                .font(.system(size: 85))
                                .fontWeight(.semibold)
                                .foregroundStyle(.purpleButton)
                            
                        }
                    }
                    
                    Text("Rédaction")
                        .semiBold()
                    
                    Text("Motivation")
                        .semiBold()
                    
                    PurpleButton(withArrow: false, buttonFuncText: "Enregistrer")
                }
            }
            
        }
    }
}

#Preview {
    JournalEditorView()
}
