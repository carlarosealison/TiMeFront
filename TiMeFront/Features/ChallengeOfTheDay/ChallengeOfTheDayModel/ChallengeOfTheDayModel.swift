//
//  ChallengeOfTheDay.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
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

enum ChallengeOfTheDayResult {
case challenge(ChallengeOfTheDayResponseDTO)
case delete(DeleteResponse)
case error(URLError)
}
