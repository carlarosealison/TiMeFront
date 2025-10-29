//
//  DayDataMapper.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - DayDataMapper
struct DayDataMapper {
    private let emotionMapper = EmotionWithDetailsMapper()
    private let heartLevelMapper = HeartLevelMapper()
    private let motivationMapper = MotivationMapper()
    private let pageMapper = PageMapper()
    
    /// Transforme le DTO agrégé du backend en Model pour l'UI
    /// Utilise les mappers individuels pour transformer chaque sous-élément
    func mapToModel(_ response: DayDataResponseDTO) -> DayDataModel {
        DayDataModel(
            date: response.date,
            emotion: response.emotion.map { emotionMapper.mapToModel($0) },
            heartLevel: response.heartLevel.map { heartLevelMapper.mapToModel($0) },
            motivation: response.motivation.map { motivationMapper.mapToModel($0) },
            page: response.page.map { pageMapper.mapToModel($0) }
        )
    }
}
