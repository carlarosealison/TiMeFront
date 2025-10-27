//
//  MotivationModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - MotivationModel
struct MotivationModel: Identifiable {
    let id: UUID
    let motivation: Int
    let createdAt: Date
    let idUser: UUID
}
