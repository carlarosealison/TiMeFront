//
//  EmotionOfTheDayMapper.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

struct EmotionOfTheDayMapper {
    func mapToUserRequest(register: EmotionOfTheDayResponseDTO) -> EmotionOfTheDayModel {
        EmotionOfTheDayModel(id: UUID(), date: register.date, idUser: register.idUser, idEmotion: register.idEmotion)
    }
}
