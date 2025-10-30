//
//  JournalEditorView.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import SwiftUI

struct JournalEditorView: View {
    @Environment(JournalEditorViewModel.self) var journalEditVM
    @State var emotionCatVM = EmotionCategoryViewModel()
    
    var body: some View {
            ZStack {
                Image(.backgroundBullet)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("Jeudi 23 Octobre")
                            .font(.system(size: 24))
                            .fontWidth(.compressed)
                            .foregroundStyle(.purpleText)
                            .padding(.trailing, 24)
                    }
                    

                    Spacer(minLength: 65)
                   
                    
                    HStack {
                        if #available(iOS 26.0, *) {
                            VStack(alignment: .leading) {
                                
                                Text("Émotion")
                                    .semiBold()
                                    .padding(.leading, 24)
                                
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
                                                .fontWeight(.light)
                                                .fontWidth(.expanded)
                                            Text("Remplissez-le selon votre ressenti")
                                                .font(.system(size: 10))
                                                .fontWeight(.thin)
                                                .fontWidth(.expanded)
                                        }.padding(.trailing,35)
                                        
                                    }.padding(.leading, 24)
                            }
                            .padding(.bottom, 40)
                            Spacer()

                            
                            
                        } else {
                            VStack(alignment: .leading) {
                                
                                Text("Émotion")
                                    .semiBold()
                                    .padding(.leading, 24)
                                
                                RoundedRectangle(cornerRadius: 20)
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
                                                .fontWeight(.light)
                                                .fontWidth(.expanded)
                                            Text("Remplissez-le selon votre ressenti")
                                                .font(.system(size: 10))
                                                .fontWeight(.thin)
                                                .fontWidth(.expanded)
                                        }.padding(.trailing,35)
                                        
                                    }.padding(.leading, 24)
                            }
                            .padding(.bottom, 40)
                            Spacer()

                        }
                    }
                    
                    VStack (alignment: .leading){
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
                    }.padding(.bottom, 40)

                    
                    VStack {
                        HStack {
                            Text("Motivation")
                                .semiBold()
                                .padding(.leading, 24)
                                .padding(.bottom, 5)
                            
                            Spacer()
                        }

                        ScrollMotivation(viewModel: journalEditVM)

                    }
                    .padding(.bottom)


                    PurpleButton(withArrow: false, buttonFuncText: "Enregistrer")
                    
                    
                }
                
                .task {
                    do{
                        try await emotionCatVM.fetchEmotionCategory()
                    }
                    catch{
                        print("error while fetching emotionCategory : \(error.localizedDescription)")
                    }
                    
                }
                
            }
            
        
        
    }
}

#Preview {
    JournalEditorView()
        .environment(JournalEditorViewModel())
        .environment(ChallengeViewModel())
}
