//
//  ChallengeMapper.swift
//  TiMeFront
//
//  Created by Apprenant125 on 03/10/2025.
//

import Foundation

//étape 3 : mettre en place le mapper de notre model -> similaire aux DTO en Vapor

struct ChallengeMapper {
    //ici je prends mon JSON challengeResponse pour le transformer en un objet Swift
    //le DTO est passé au mapper pour le mettre sous forme de ChallengeModel
    
    //pour récupérer un Challenge
    func mapChallengeResponse(register: ChallengeResponseDTO) -> ChallengeModel{
        ChallengeModel(id: register.id, instruction: register.instruction, messageMotivation: register.messageMotivation)
    }
    
    //pour récupérer plusieurs challenges ( sous forme d'array)
    func mapChallengesResponse(register: ChallengeResponseDTO) -> [ChallengeModel]{
        let indexChallengeResponse = [
            ChallengeModel(id: register.id, instruction: register.instruction, messageMotivation: register.messageMotivation)
        ]
        return indexChallengeResponse
    }
    
    
}
