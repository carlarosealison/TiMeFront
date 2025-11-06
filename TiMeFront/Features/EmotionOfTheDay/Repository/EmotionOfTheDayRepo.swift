//
//  EmotionOfTheDayRepo.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

class EmotionOfTheDayRepo {
    
    private let service = EmotionOfTheDayService()
    private let mapper = EmotionOfTheDayMapper()
    struct EmptyResponse: Codable {}
    
    // Crée une émotion du jour
    func createEmotionOfTheDay(date: Date, idUser: UUID, idEmotion: UUID) async throws -> EmotionOfTheDayModel {
        // Créer le DTO Request avec les données
        let request = EmotionOfTheDayRequestDTO(
            date: date,
            idUser: idUser,
            idEmotion: idEmotion
        )
        // Appeler le service qui fait l'appel réseau
        let response = try await service.createEmotionOfTheDay(request: request)
        
        // Transformer la réponse DTO en Model via le Mapper
        return mapper.mapToModel(response)
    }
    
    func addEmotion(_ create: EmotionOfTheDayCreate) async throws -> EmotionOfTheDayModel {
        return try await createEmotionOfTheDay(
            date: Date(),
            idUser: create.userID,
            idEmotion: create.emotionID
        )
    }
    // Supprimer l'émotion
    func deleteEmotion(_ id: UUID) async throws {
        let apiService = APIService()
        let _: EmptyResponse = try await apiService.delete(
            endpoint: "emotionOfTheDay/\(id.uuidString)"
        )
    }
}
