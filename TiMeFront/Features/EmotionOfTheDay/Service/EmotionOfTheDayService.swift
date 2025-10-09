//
//  EmotionOfTheDayService.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

struct EmotionOfTheDayService {
    
    private let api = APIService()
    
    // Crée une émotion du jour via l'API
    func createEmotionOfTheDay(request: EmotionOfTheDayRequestDTO) async throws -> EmotionOfTheDayResponseDTO {
        try await api.post(
            endpoint: "emotionOfTheDay/create",
            body: request
        )
        // Retourne automatiquement EmotionOfTheDayResponseDTO grâce aux génériques
    }
}
