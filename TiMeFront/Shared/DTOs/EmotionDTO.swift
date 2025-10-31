//
//  EmotionDTO.swift
//  TiMeFront
//
//  Created by Thibault on 09/10/2025.
//

import Foundation

struct EmotionResponseDTO: Codable, Identifiable, Hashable {
    let id: UUID?
    let title: String
    let categoryID: UUID
}
