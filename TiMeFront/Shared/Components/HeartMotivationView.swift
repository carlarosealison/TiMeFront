//
//  HeartMotivationView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 30/10/2025.
//

import SwiftUI

struct HeartMotivationView: View {
    @Binding var viewModel : JournalEditorViewModel
    var body: some View {
        ZStack {
            Image(systemName: "heart")
                .resizable()
                .foregroundStyle(.purpleButton)
                .padding(.bottom,2)
            
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundStyle(.purpleButton)
                .frame(height: viewModel.sliderHeight)
                .padding(.bottom,2)
        }
        .frame(height: 105)
        .scaledToFit()
        
    }
}

#Preview {
    HeartMotivationView(viewModel: .constant(JournalEditorViewModel()))
}
