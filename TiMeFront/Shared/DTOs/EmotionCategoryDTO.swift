//
//  EmotionCategoryDTO.swift
//  TiMeFront
//
//  Created by apprenant152 on 20/10/2025.
//

import Foundation

struct EmotionCategoryResponseDTO: Decodable{
    let id: UUID?
    let title: String
    let color: String
}
