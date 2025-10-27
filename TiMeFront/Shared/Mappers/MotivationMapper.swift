//
//  MotivationMapper.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - MotivationMapper
struct MotivationMapper {
    /// Transforme la réponse du backend en Model utilisable dans l'app
    func mapToModel(_ response: MotivationResponseDTO) -> MotivationModel {
        MotivationModel(
            id: response.id ?? UUID(),
            motivation: response.motivation,
            createdAt: response.createdAt,
            idUser: response.idUser
        )
    }
}
