//
//  EmotionMapper.swift
//  TiMeFront
//
//  Created by Thibault on 09/10/2025.
//

import Foundation

struct EmotionMapper {
    func mapToModel(_ response: EmotionResponseDTO) -> EmotionModel {
        EmotionModel(
            id: response.id ?? UUID(),
            title: response.title,
            categoryID: response.categoryID
        )
    }
}
