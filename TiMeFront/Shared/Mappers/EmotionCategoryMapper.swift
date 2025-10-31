//
//  EmotionCategoryMapper.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import Foundation

struct EmotionCategoryMapper{
    func mapEmotionCategoryResponse(_ response: EmotionCategoryResponseDTO) -> EmotionCategoryModel{
        EmotionCategoryModel(id: response.id ?? UUID(), title: response.title, color: response.color)
    }
    
    
    func mapEmotionCategoryStatsResponse(from dto: EmotionCategoryStatsResponseDTO) -> EmotionCategoryStats{
        EmotionCategoryStats(id: dto.categoryId, title: dto.categoryTitle, color: dto.color, count: dto.count)
    }
    
}
