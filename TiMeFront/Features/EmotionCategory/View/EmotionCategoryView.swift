//
//  EmotionCategoryView.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import SwiftUI

struct EmotionCategoryView: View {
    
    @State var emotionVM = EmotionCategoryViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading){
            ForEach(emotionVM.emotionsCategory) { c in
                HStack{
                    Capsule()
                        .fill(ColorMapper.color(from: c.color))
                        .frame(width: 20, height: 10)
                    Text(c.title)
                        .subTitle()
                }
            
               
            }
        }.onAppear{
            Task{
                do{
                    try await emotionVM.fetchEmotionCategory()
                }catch{
                    print("Error: Impossible de récupérer les catégories d'émotions \(error)")
                }
                
            }
        }
    }
}

#Preview {
    EmotionCategoryView()
}
