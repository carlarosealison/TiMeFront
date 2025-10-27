//
//  EmotionCategoryViewModel.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import Foundation

@Observable
class EmotionCategoryViewModel{
    
    let emotionCategoryRepo = EmotionCategoryRepo()
    var emotionsCategory: [EmotionCategoryModel] = []
    
    func fetchEmotionCategory()async throws{
        let categories = try await emotionCategoryRepo.getAll()
        self.emotionsCategory = categories
    }
    
}
