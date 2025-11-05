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
//        .gesture(
//            DragGesture()
//                .onChanged({ value in
//                    viewModel.sliderHeight = -value.translation.height + viewModel.lastDragValue
//                    //j'établis la hauteur du slider, soit le dragGesture + la sauvegarde du dernire dragGesture
//                    
//                    viewModel.sliderHeight = viewModel.sliderHeight > viewModel.heartMaxHeight ? viewModel.heartMaxHeight : viewModel.sliderHeight
//                    //je garde les dragGesture dans la frame totale, pour ne pas que ça dépasse
//                    
//                    viewModel.sliderHeight = viewModel.sliderHeight >= 0 ? viewModel.sliderHeight : 0
//                    //je fais en sorte que le dragGesture ne soit pas négatif
//                    
//                })
//            
//                .onEnded({ value in
//                    viewModel.lastDragValue = viewModel.sliderHeight
//                    // je sauvegarde le dragGesture à sa position de fin
//                    
//                    viewModel.sliderHeight = viewModel.sliderHeight > viewModel.heartMaxHeight ? viewModel.heartMaxHeight : viewModel.sliderHeight
//                    //idem, je garde les dragGesture dans la frame totale, pour ne pas que ça dépasse
//                    
//                    viewModel.sliderHeight = viewModel.sliderHeight >= 0 ? viewModel.sliderHeight : 0
//                    //idem, je fais en sorte que le dragGesture ne soit pas négatif
//                    
//                    viewModel.sliderProgress = CGFloat(viewModel.sliderHeight / viewModel.heartMaxHeight)
//                    //idem, je calcule la progression du dragGesture en fonction de sa position dans la frame entière
//                    
//                })
//        )
    }
}

#Preview {
    HeartLevelView(viewModel: .constant(JournalEditorViewModel()))
}
