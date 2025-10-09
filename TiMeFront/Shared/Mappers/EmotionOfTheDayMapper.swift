//
//  EmotionOfTheDayMapper.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

struct EmotionOfTheDayMapper {
    
    // Transforme la réponse du backend en Model utilisable dans l'app
    func mapToModel(_ response: EmotionOfTheDayResponseDTO) -> EmotionOfTheDayModel {
        EmotionOfTheDayModel(
            id: response.id ?? UUID(),  // Si pas d'id, on en génère un (sécurité)
            date: response.date,
            idUser: response.idUser,
            idEmotion: response.idEmotion
        )
    }
}
