//
//  JournalEditorView.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import SwiftUI

struct JournalEditorView: View {
    @State var emotionCatVM = EmotionCategoryViewModel()
    @State var emotionOTDViewModel = EmotionOfTheDayViewModel()
    @State var emotionVM = EmotionViewModel()
    @Binding var viewModel : JournalEditorViewModel
    
    var body: some View {
        ZStack {
            Image(.backgroundDots)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                //                Spacer()
                
                
                HStack {
                    Spacer()
                    
                    Text(viewModel.today)
                        .font(.system(size: 24))
                        .fontWidth(.compressed)
                        .foregroundStyle(.purpleText)
                        .padding(.trailing, 24)
                }
                
                
                Spacer(minLength: 25)
                
                
                ZStack {
                    if #available(iOS 26.0, *) {
                        ScrollView(.horizontal){
                            
                            HStack(spacing: -35) {
                                
                                ForEach(viewModel.randomEmotions, id: \.self) { emotion in
                                    
                                    let emotionColor = viewModel.emotionCategories.first(where: {$0.id == emotion.categoryID})?.color
                                    
                                    MoodValidationStick(
                                        stickColor: emotionColor ?? "white",
                                        emotion: emotion.title, isSelected: false,
                                        buttonSign: "plus",
                                        onValidate: {
                                            Task{
                                                await emotionOTDViewModel.addEmotionOfTheDay()
                                            }
                                        },
                                        onDelete: {
                                            Task{
                                                await emotionOTDViewModel.deleteEmotionOfTheDay()
                                            }
                                        })
                                }
                                
                                
                                NavigationLink {
                                    // TODO: doit naviger vers la page des choix des émotions
                                    EmotionListView()
                                } label: {
                                    HStack {
                                        ZStack {
                                            Capsule()
                                                .glassEffect(.regular.tint(.white))
                                                .frame(width: 44, height: 110)
                                                .overlay {
                                                    //                                                        isSelected.toggle()
                                                    
                                                    Circle()
                                                        .glassEffect(.regular.tint(.white))
                                                        .frame(width: 44)
                                                        .overlay {
                                                            Image(systemName: "arrow.right")
                                                                .font(.system(size: 20))
                                                        }
                                                        .padding([.leading, .top], 45)
                                                }
                                            
                                            Text("Voir plus")
                                                .textCards()
                                                .padding([.leading, .bottom], 40)
                                        }
                                    }
                                    .frame(width: 140)                            }.buttonStyle(.plain)
                            }
                            
                            
                        }.scrollIndicators(.hidden).padding(.leading, 170)
                        
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Émotion")
                                .semiBold()
                                .padding(.leading, 24)
                            if #available(iOS 26.0, *) {
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .glassEffect(in: .rect(cornerRadius: 20))
                                    .frame(width: 175 ,height: 170)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        VStack (alignment: .leading){
                                            HeartMotivationView(viewModel: $viewModel)
                                            
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
                            }                     else {
                                VStack(alignment: .leading) {
                                    
                                    Text("Émotion")
                                        .semiBold()
                                        .padding(.leading, 24)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 175 ,height: 170)
                                        .foregroundStyle(.white)
                                        .overlay {
                                            VStack (alignment: .leading){
                                                HeartMotivationView(viewModel: $viewModel)
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
                        .padding(.bottom, 40)
                        Spacer()
                    }

                    Spacer()
                    
                    
                    
                    

                    
                    
                }
                
                VStack (alignment: .leading){
                    Text("Rédaction")
                        .semiBold()
                    
                    if #available(iOS 26.0, *) {
                        Button {
                            viewModel.showSheet.toggle()
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 350, height: 90)
                                .glassEffect(.regular.tint(.purpleButton.mix(with: .whitePurple, by: 0.25)), in: .rect(cornerRadius: 20))
                                .overlay {
                                    Image(systemName: "pencil.and.scribble")
                                        .foregroundStyle(.whitePurple)
                                        .font(.system(size: 35))
                                }
                        }.buttonStyle(.plain)
                            .sheet(isPresented: $viewModel.showSheet) {
                                JournalTextEditorView(viewModel: $viewModel)
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
                    
                    ScrollMotivation(viewModel: viewModel)
                    
                }.padding(.bottom)
                
                
                PurpleButton(withArrow: false, buttonFuncText: "Enregistrer")
                
                
            }
            
            .task {
                do{
                    viewModel.fetchRandomEmotions()
                    viewModel.fetchCatEmotionColor()
                }
            }
        }
    }
}

#Preview {
    JournalEditorView(viewModel: .constant(JournalEditorViewModel()))
        .environment(JournalEditorViewModel())
        .environment(ChallengeViewModel())
        .environment(AuthViewModel())
    
}
