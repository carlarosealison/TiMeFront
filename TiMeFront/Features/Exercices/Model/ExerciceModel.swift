//
//  ExerciseModel.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//

import Foundation

struct ExerciseResponse: Codable {
    let id: UUID?
    let instruction: String
    let image: String
    let challengeID: UUID?
}
