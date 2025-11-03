//
//  ChallengeOfTheDayModel.swift
//  TiMeFront
//
//  Created by Carla on 17/10/2025.
//

import Foundation

struct ChallengeOfTheDayModel {
    var id : UUID
    var dateExp : Date
    var instruction : String
    var messageMotivation : String
    var id_user : UUID
    var id_challenge : UUID
}

struct DeleteResponse : Decodable {
    let success: Bool
}

struct ChallengeOfTheDayResponse: Decodable {
    let id: UUID?
    let instructionOTD: String
    let messageMotivationOTD: String
    let dateExp: Date
    let idChallenge: ParentID
    let idUser: ParentID
}

struct ParentID: Decodable {
    let id: UUID
}

enum ChallengeOfTheDayResult {
case challenge(ChallengeOfTheDayResponseDTO)
case delete(DeleteResponse)
case error(URLError)
}
