//
//  HeartLevelMapper.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - HeartLevelMapper
struct HeartLevelMapper {
    /// Transforme la réponse du backend en Model utilisable dans l'app
    func mapToModel(_ response: HeartLevelResponseDTO) -> HeartLevelModel {
        HeartLevelModel(
            id: response.id ?? UUID(),  // Si pas d'id, on en génère un (sécurité)
            level: response.level,
            createdAt: response.createdAt,
            idUser: response.idUser
        )
    }
}
