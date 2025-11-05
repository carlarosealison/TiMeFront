//
//  JournalTextEditorView.swift
//  TiMeFront
//
//  Created by Carla on 29/10/2025.
//

import SwiftUI

struct JournalTextEditorView: View {
    @Binding var viewModel : JournalEditorViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(AuthViewModel.self) var authVM
    
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    dismiss()
                    viewModel.textOfTheDay = ""
                } label: {
                    Circle()
                        .frame(width: 44)
                        .foregroundStyle(.grayPurple)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundStyle(.purpleText)
                        }
                }.buttonStyle(.plain)
                Spacer()
                Text("Rédaction")
                    .semiBoldCardsTitle()
                Spacer()
                
                
                Button{
                    //TODO: Bouton pour poster le message
                    viewModel.noteSaved.toggle()
                          
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                      dismiss()
                    }
                        
                    
                    
                    
                } label: {
                    Circle()
                        .frame(width: 44)
                        .foregroundStyle(viewModel.noteSaved ? .greenCustom : .purpleText)
                        .overlay {
                            withAnimation(.bouncy(duration: 0.1)){
                                Image(systemName: viewModel.noteSaved ? "checkmark" : "arrow.up")
                                    .foregroundStyle(.whitePurple)
                            }
                        }
                }.buttonStyle(.plain)
                
                
            }.padding(.horizontal)
            
            
            ZStack {
                
                if #available(iOS 26.0, *) {
                    RoundedRectangle(cornerRadius: 42)
                        .glassEffect(.regular.tint(.whitePurple), in: RoundedRectangle(cornerRadius: 42))
                        .overlay(alignment: .topLeading){
                            Text(viewModel.textOfTheDay.isEmpty ? "Aujourd'hui je me sens..." : "")
                                .textCards()
                                .opacity(0.5)
                                .padding([.horizontal, .vertical], 30)
                        }
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.grayPurple)
                        .overlay(alignment: .topLeading){
                            Text(viewModel.textOfTheDay.isEmpty ? "Aujourd'hui je me sens..." : "")
                                .textCards()
                                .opacity(0.5)
                                .padding([.horizontal, .vertical], 30)
                        }
                }
                
                TextEditor(text: $viewModel.textOfTheDay)
                    .textEditorStyle(.plain)
                    .padding([.horizontal, .vertical], 24)
                    .textCards()
                    .overlay(content: {
                        if viewModel.noteSaved {
                            ZStack {
                                RoundedRectangle(cornerRadius: 42)
                                    .foregroundStyle(.greenCustom.opacity(0.7))
                                
                                Text("Validé!")
                                    .boldTextWhite()
                                
                            }
                        }
                    })
                    .overlay(alignment: .bottomTrailing){
                        Image(systemName: "pencil.and.scribble")
                            .font(.system(size: 50))
                            .foregroundStyle(.whitePurple)
                            .padding([.horizontal, .vertical], 45)
                    }
                    .onChange(of: viewModel.textOfTheDay) { oldValue, newValue in
                        viewModel.noteSaved = false
                    }
                

                
                
            }
        }
        .padding([.horizontal, .vertical])
        .presentationDetents([.medium])
        
    }
}

#Preview {
    JournalTextEditorView(viewModel: .constant(JournalEditorViewModel()))
        .environment(AuthViewModel())
}
