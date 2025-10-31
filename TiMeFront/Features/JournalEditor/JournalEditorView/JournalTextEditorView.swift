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
    var body: some View {
        VStack {
            HStack{
                Button {
                    dismiss()
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
                Button {
                    //TODO: Bouton pour poster le message
                } label: {
                    Circle()
                        .frame(width: 44)
                        .foregroundStyle(.purpleText)
                        .overlay {
                            Image(systemName: "arrow.up")
                                .foregroundStyle(.whitePurple)
                        }
                }.buttonStyle(.plain)

            }.padding(.horizontal)
  

            ZStack {
                
                if #available(iOS 26.0, *) {
                    RoundedRectangle(cornerRadius: 42)
                        .glassEffect(.regular.tint(.whitePurple), in: RoundedRectangle(cornerRadius: 42))
                        .overlay(alignment: .bottomTrailing){
                            Image(systemName: "pencil.and.scribble")
                                .font(.system(size: 50))
                                .foregroundStyle(.whitePurple)
                                .padding([.horizontal, .vertical], 45)
                        }
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.grayPurple)
                }
                
                TextField("Aujourd'hui je me sens...", text: $viewModel.textOfTheDay)
                    .textCards()
                    .padding([.horizontal, .vertical])
                
                
                
            }.navigationTitle("Rédaction")
        }.padding([.horizontal, .vertical])
            .presentationDetents([.medium])
    }
}

#Preview {
    JournalTextEditorView(viewModel: .constant(JournalEditorViewModel()))
}
