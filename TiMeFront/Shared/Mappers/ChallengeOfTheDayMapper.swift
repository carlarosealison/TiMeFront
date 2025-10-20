//
//  ChallengeOfTheDayMapper.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
//

import Foundation


struct ChallengeOfTheDayMapper {
    
    func mapChallengeOfTheDayResponse(register: ChallengeOfTheDayResponseDTO) -> ChallengeOfTheDayModel{
        ChallengeOfTheDayModel(id: register.id , dateExp: register.dateExp, instruction: register.instruction, messageMotivation: register.messageMotivation ,id_user: register.id_user, id_challenge: register.id_chellenge)
    }
}
