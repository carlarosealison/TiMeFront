//
//  EmotionCategoryModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - EmotionCategoryModel
struct EmotionCategoryModel: Identifiable, Hashable {
    let id: UUID
    let title: String
    let color: String
}
