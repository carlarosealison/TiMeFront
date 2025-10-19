//
//  MotivationDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - MotivationResponseDTO
struct MotivationResponseDTO: Codable, Identifiable {
    let id: UUID?
    let motivation: Int
    let createdAt: Date
    let idUser: UUID
}
