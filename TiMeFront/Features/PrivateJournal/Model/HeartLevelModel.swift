//
//  HeartLevelModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - HeartLevelModel
struct HeartLevelModel: Identifiable {
    let id: UUID
    let level: Int
    let createdAt: Date
    let idUser: UUID
}
