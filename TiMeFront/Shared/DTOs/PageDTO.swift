//
//  PageDTO.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - PageResponseDTO
struct PageResponseDTO: Codable, Identifiable {
    let id: UUID?
    let note: String
    let createdAt: Date
    let idUser: UUID
}

//MARK: - PageRequestDTO
struct PageRequestDTO : Codable {
    let idUser: UUID
    let note : String
}
