//
//  ChallengeOfTheDayDTO.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
//

import Foundation

struct ChallengeOfTheDayRequestDTO : Codable {
    let dateExp: Date
    let instruction: String
    let messageMotivation: String
    let id_user: UUID
    let id_challenge: UUID
}

struct ChallengeOfTheDayResponseDTO : Decodable {
    let id : UUID
    let dateExp: Date
    let instruction: String
    let messageMotivation: String
    let id_user: UUID
    let id_challenge: UUID
}
