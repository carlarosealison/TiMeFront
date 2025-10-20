//
//  ChallengeRepo.swift
//  TiMeFront
//
//  Created by Apprenant125 on 06/10/2025.
//

import Foundation

@Observable
class ChallengeRepo {
    
    // étape 5: permet de récupérer en JSON et de modifier ce que le client reçoit sous forme de DTO
    //similaire au contoller dans dans Vapor
    
    private let service = ChallengeService()
    private let mapper = ChallengeMapper()
    

    
    func createChallenge(instruction : String, messageMotivation: String, dateExp: Date) async throws -> ChallengeModel {
        let request = ChallengeRequestDTO(instruction: instruction, messageMotivation: messageMotivation)
        
        let response = try await service.createChallenge(challenge: request)
        return mapper.mapChallengeResponse(register: response)
    }
    
    func getChallengeById(id: UUID) async throws -> ChallengeModel {
        let response = try await service.getChallenge(challengeID: id)
        return mapper.mapChallengeResponse(register: response)
    }
    
    func indexChallenge() async throws -> [ChallengeModel] {
        let response = try await service.indexChallenge()
        return mapper.mapChallengesResponse(register: response)
    }
    
    func randomChallenge() async throws -> ChallengeModel {
        let response = try await service.randomChallenge()
        return mapper.mapChallengeResponse(register: response)
    }
    
    // TODO: Sauvegarder le challenge pour qu'il reste quand on ferme l'app
    func saveCurrentChallenge(_ challenge: ChallengeModel) async throws {
        // Appel API pour sauvegarder sur le backend
        // try await service.saveCurrentChallenge(challenge)
    }

    func getCurrentChallenge() async throws -> ChallengeModel? {
        // Appel API pour récupérer le challenge du jour
        // try await service.getCurrentChallenge()
        // TODO: Implémenter l'appel au service et mapper la réponse
        return nil
    }
}
