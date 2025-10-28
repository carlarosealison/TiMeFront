//
//  EmotionCategoryRepo.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import Foundation

struct EmotionCategoryRepo{
    
    let emotionCategoryService = EmotionCategoryService()
    let emotionCategoryMapper = EmotionCategoryMapper()
    
    func getAll()async throws -> [EmotionCategoryModel]{
        let emotionRest = try await emotionCategoryService.getAll()
        return emotionRest.map({emotionCategoryMapper.mapEmotionCategoryResponse($0)})
    }
}
