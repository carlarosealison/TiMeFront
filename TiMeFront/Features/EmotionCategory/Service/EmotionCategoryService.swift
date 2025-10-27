//
//  EmotionCategoryService.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import Foundation

struct EmotionCategoryService{
    
    let apiService = APIService()
    
    func getAll()async throws -> [EmotionCategoryResponseDTO]{
        let emotions = try await apiService.get(endpoint: "emotion-category", as: [EmotionCategoryResponseDTO].self)
        return emotions
    }
}
