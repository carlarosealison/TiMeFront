//
//  HeartLevelView.swift
//  TiMeFront
//
//  Created by Carla on 30/10/2025.
//

import SwiftUI

struct HeartLevelView: View {
    @Binding var viewModel : JournalEditorViewModel
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .foregroundStyle(.purpleButton)
                    .frame(height: viewModel.sliderHeight) // je met en place la hauteur du slider
                    .position(x: geo.size.width / 2, y: geo.size.height - (viewModel.sliderHeight / 2)) // la position permet au cœur de démarrer d'en bas
                    .clipped()
            }
            .mask {
                //met en place la shape du coeur en plein heart.fill
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.purpleButton)
            }
            
            //le contour du coeur en dehors du .mask
            Image(systemName: "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.purpleButton)
            
        }
        .frame(height: viewModel.heartMaxHeight) // ici la hauteur totale de la graduation
        .scaledToFit()
        .task {
            await viewModel.fetchHeartLevels()
             viewModel.fetchHeartLevel()
        }
    }
}

#Preview {
    HeartLevelView(viewModel: .constant(JournalEditorViewModel()))
}
