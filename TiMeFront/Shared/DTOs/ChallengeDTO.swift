//
//  ChallengeDTO.swift
//  TiMeFront
//
//  Created by Apprenant125 on 03/10/2025.
//

import Foundation
//étape1: Mettre en place des DTO pour recevoir la data depuis Vapor

// pour envoyer du code en JSON et l'encoder/décoder en JSON
struct ChallengeRequestDTO : Codable {
    var instruction : String
    var messageMotivation : String
}

//pour récupérer du code en JSON et le décoder
struct ChallengeResponseDTO : Decodable {
    var id : UUID
    var instruction : String
    var messageMotivation : String
}


//étape 2: S'assurer avoir mis en place le model correspondant
