//
//  EmotionWithDetailsMapper.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - EmotionWithDetailsMapper
struct EmotionWithDetailsMapper {
    /// Transforme la réponse enrichie du backend (avec titre + couleur)
    func mapToModel(_ response: EmotionWithDetailsResponseDTO) -> EmotionWithDetailsModel {
        EmotionWithDetailsModel(
            id: response.id ?? UUID(),
            date: response.date,
            emotionId: response.emotionId,
            emotionTitle: response.emotionTitle,
            emotionColor: response.emotionColor,
            categoryId: response.categoryId,
            categoryTitle: response.categoryTitle
        )
    }
}
