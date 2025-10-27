//
//  EmotionDTO.swift
//  TiMeFront
//
//  Created by Thibault on 09/10/2025.
//

import Foundation

struct EmotionResponseDTO: Codable, Identifiable {
    let id: UUID?
    let title: String
    let categoryID: UUID
}
