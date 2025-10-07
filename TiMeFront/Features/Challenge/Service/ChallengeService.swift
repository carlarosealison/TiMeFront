//
//  ChallengeService.swift
//  TiMeFront
//
//  Created by Apprenant125 on 06/10/2025.
//

import Foundation

struct ChallengeService {
    
    
    //étape 4: faire les appels API avec les endpoint correspondants
    
    private let api = APIService()

        
    func createChallenge(challenge: ChallengeRequestDTO) async throws -> ChallengeResponseDTO{
        try await api.post(endpoint: "challenge", body: challenge)
    }
    
    func getChallenge(challengeID: UUID) async throws ->
    ChallengeResponseDTO {
        try await api.get(endpoint: "challenge/\(challengeID)", as: ChallengeResponseDTO.self)
    }
}
