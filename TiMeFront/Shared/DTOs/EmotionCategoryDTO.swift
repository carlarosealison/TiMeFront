//
//  EmotionCategoryDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - EmotionCategoryResponseDTO (pour récupérer la couleur)
struct EmotionCategoryResponseDTO: Codable, Identifiable {

    let id: UUID?
    let title: String
    let color: String
}


struct EmotionCategoryStatsResponseDTO: Decodable {
    var id: UUID { categoryId } // pour l'utiliser dans les ForEach SwiftUI
    var categoryId: UUID
    var categoryTitle: String
    var color: String
    var count: Int
}
