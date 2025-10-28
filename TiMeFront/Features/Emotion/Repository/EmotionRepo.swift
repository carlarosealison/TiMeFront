//
//  EmotionRepo.swift
//  TiMeFront
//
//  Created by Thibault on 09/10/2025.
//

import Foundation

class EmotionRepo {
    private let service = EmotionOfTheDayService()
    private let emotionService = EmotionService()
    private let mapper = EmotionMapper()
    
    func getDailySuggestion() async throws -> EmotionModel {
        let response = try await service.getDailySuggestion()
        return mapper.mapToModel(response)
    }
    
//    func getRandomEmotions() async throws -> [EmotionResponseDTO]{
//        let response = try await emotionService.getRandomEmotions()
//        return mapper.mapToModel(response)
//    }

}
