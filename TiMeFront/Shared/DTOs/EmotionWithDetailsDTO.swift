//
//  EmotionWithDetailsDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - EmotionWithDetailsResponseDTO
/// DTO enrichi qui inclut le titre ET la couleur (récupérés via JOIN côté backend)
struct EmotionWithDetailsResponseDTO: Codable, Identifiable {
    let id: UUID?
    let date: Date
    let emotionId: UUID
    let emotionTitle: String
    let emotionColor: String
    let categoryId: UUID
    let categoryTitle: String
}
