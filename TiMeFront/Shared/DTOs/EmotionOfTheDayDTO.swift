//
//  EmotionOfTheDayDTO.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

struct EmotionOfTheDayRequestDTO: Codable {
    let date: Date
    let idUser: UUID
    let idEmotion: UUID
}

struct EmotionOfTheDayResponseDTO: Codable {
    let id: UUID?
    let date: Date
    let idUser: UUID
    let idEmotion: UUID
}
