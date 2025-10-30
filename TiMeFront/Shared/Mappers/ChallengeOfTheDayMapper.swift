//
//  ChallengeOfTheDayMapper.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
//

import Foundation


struct ChallengeOfTheDayMapper {
    
    func mapChallengeOfTheDayResponse(register: ChallengeOfTheDayResponseDTO) -> ChallengeOfTheDayResponseDTO{
        ChallengeOfTheDayResponseDTO(id: register.id, dateExp: register.dateExp, instruction: register.instruction, messageMotivation: register.messageMotivation, id_user: register.id_user, id_challenge: register.id_challenge)
    }
    
    // essai mais pas sûre de la procedure car il me semble que le mapper est pour la donnée qu'on récupère et non celle qu'on envoie
    func mapChallengeOfTheDayRequest(register: ChallengeOfTheDayRequestDTO) -> ChallengeOfTheDayRequestDTO{
        ChallengeOfTheDayRequestDTO(dateExp: register.dateExp, instruction: register.instruction, messageMotivation: register.messageMotivation, id_user: register.id_user, id_challenge: register.id_challenge)
    }
}
