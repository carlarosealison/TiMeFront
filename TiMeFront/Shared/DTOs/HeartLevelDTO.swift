//
//  HeartLevelDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - HeartLevelResponseDTO
struct HeartLevelResponseDTO: Codable, Identifiable {
    let id: UUID?
    let level: Int
    let createdAt: Date
    let idUser: UUID
}
