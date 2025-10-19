//
//  EmotionWithDetailsModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - EmotionWithDetailsModel
/// Modèle enrichi pour afficher l'émotion avec tous ses détails
struct EmotionWithDetailsModel: Identifiable {
    let id: UUID
    let date: Date
    let emotionId: UUID
    let emotionTitle: String
    let emotionColor: String
    let categoryId: UUID
    let categoryTitle: String
}
