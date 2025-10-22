//
//  DayDataDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - DayDataResponseDTO
/// DTO qui agrège toutes les données d'un jour
/// Reçu depuis GET /day/:userId/:date
struct DayDataResponseDTO: Codable {
    let date: Date
    let emotion: EmotionWithDetailsResponseDTO?
    let heartLevel: HeartLevelResponseDTO?
    let motivation: MotivationResponseDTO?
    let page: PageResponseDTO?
}
