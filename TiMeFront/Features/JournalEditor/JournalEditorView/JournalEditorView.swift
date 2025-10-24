//
//  JournalEditorView.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import SwiftUI

struct JournalEditorView: View {
    @State var viewModel = JournalEditorViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image(.backgroundBullet)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Jeudi 23 Octobre")
                        .font(.system(size: 24))
                        .fontWidth(.compressed)
                        .foregroundStyle(.purpleText)
                    
                    Text("Émotion")
                        .semiBold()
                    
                    if #available(iOS 26.0, *) {
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(in: .rect(cornerRadius: 20))
                            .frame(width: 175 ,height: 170)
                            .foregroundStyle(.white)
                        //                            .shadow(radius: 3, y: 4)
                            .overlay {
                                VStack (alignment: .leading){
                                    Image(systemName: "heart")
                                    //                                    .resizable()
                                    //                                    .aspectRatio(0.7, contentMode: .fit)
                                        .font(.system(size: 70))
                                        .foregroundStyle(.purpleButton)
                                        .padding(.bottom,2)
                                    Text("Niveau d'émotion")
                                        .font(.system(size: 12))
                                        .fontWeight(.thin)
                                        .fontWidth(.expanded)
                                    Text("Remplissez-le selon votre ressenti")
                                        .font(.system(size: 8))
                                        .fontWeight(.thin)
                                        .fontWidth(.expanded)
                                }
                                
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
                    
                    if #available(iOS 26.0, *) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 90)
                            .glassEffect(.regular.tint(.purpleButton.mix(with: .whitePurple, by: 0.25)), in: .rect(cornerRadius: 20))
                            .overlay {
                                Image(systemName: "pencil.and.scribble")
                                    .foregroundStyle(.whitePurple)
                                    .font(.system(size: 35))
                            }
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 90)
                            .foregroundStyle(.purpleButton)
                            .overlay {
                                Image(systemName: "pencil.and.scribble")
                                    .foregroundStyle(.whitePurple)
                                    .font(.system(size: 35))
                            }
                    }
                    
                    
                    Text("Motivation")
                        .semiBold()
                    
                    HStack {
                        Text("\(viewModel.tempValue)")
                            .font(.system(size: 40))
                            .fontWidth(.expanded)
                            .foregroundStyle(.purpleText)
                            .contentTransition(.numericText())
                        
                        Text("%")
                            .font(.system(size: 12))
                            .fontWidth(.expanded)
                            .fontWeight(.semibold)
                            .padding(.top)
                    }
                    

                    
                    PurpleButton(withArrow: false, buttonFuncText: "Enregistrer")
                }
                
                
                
            }
            
        }
    }
}

#Preview {
    JournalEditorView()
}
