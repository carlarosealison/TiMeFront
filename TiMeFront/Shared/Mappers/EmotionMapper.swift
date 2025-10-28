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
    
    func mapEmotionsResponse(register : EmotionResponseDTO) -> [EmotionModel ] {
        let emotionsResponse = [EmotionModel(id: register.id ?? UUID(), title: register.title, categoryID: register.categoryID)]
        return emotionsResponse
    }
}
