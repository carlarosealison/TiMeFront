//
//  PageMapper.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

struct PageMapper {
    /// Transforme la réponse du backend en Model utilisable dans l'app
    func mapToModel(_ response: PageResponseDTO) -> PageModel {
        PageModel(
            id: response.id ?? UUID(),
            note: response.note,
            createdAt: response.createdAt,
            idUser: response.idUser
        )
    }
}
