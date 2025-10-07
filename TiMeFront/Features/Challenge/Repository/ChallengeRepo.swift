//
//  ChallengeRepo.swift
//  TiMeFront
//
//  Created by Apprenant125 on 06/10/2025.
//

import Foundation

class ChallengeRepo {
    
    // étape 5: permet de récupérer en JSON et de modifier ce que le client reçoit sous forme de DTO
    
    private let service = ChallengeService()
    private let mapper = ChallengeMapper()
    
//    init(service: ChallengeService) {
//        self.service = service
//    }
    
    func createChallenge(instruction : String, messageMotivation: String) async throws -> ChallengeModel {
        let request = ChallengeRequestDTO(instruction: instruction, messageMotivation: messageMotivation)
        
        let response = try await service.createChallenge(challenge: request)
        return mapper.mapChallengeResponse(register: response)
    }
    
    func getChallengeById(id: UUID) async throws -> ChallengeModel {
        let response = try await service.getChallenge(challengeID: id)
        return mapper.mapChallengeResponse(register: response)
    }
}
