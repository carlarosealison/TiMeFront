//
//  ChallengeOfTheDayRepo.swift
//  TiMeFront
//
//  Created by Carla on 17/10/2025.
//

import Foundation

class ChallengeOfTheDayRepo {
    
    private let service = ChallengeOfTheDayService()
    private let mapper = ChallengeOfTheDayMapper()
    
    
    func createRandomChallengeOfTheDay(userId: UUID) async throws -> ChallengeOfTheDayResponse {
        print("📦 [Repo] Création challenge pour user: \(userId)")
        return try await service.createRandomChallengeOfTheDay(userId: userId)
    }
    
//    func postRandomChallengeOfTheDay(dateExp: Date, instruction : String, messageMotivation : String, id_user: UUID, id_challenge: UUID) async throws -> ChallengeOfTheDayRequestDTO {
//        
//        let request = ChallengeOfTheDayRequestDTO(dateExp: dateExp, instruction: instruction, messageMotivation: messageMotivation, id_user: id_user, id_challenge: id_challenge)
//        
//        let response = try await service.postRandomChallengeOfTheDay(userID: request.id_user)
//        return mapper.mapChallengeOfTheDayRequest(register: response)
//    }
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO {
        print("📦 [Repo] Appel du service getChallengeOfTheDay()...")

        let response = try await service.getChallengeOfTheDay()
        
        print("📦 [Repo] Réponse reçue:")
        print("   ID: \(response.id)")
        print("   Instruction: \(response.instruction)")
        
        let mapped = mapper.mapChallengeOfTheDayResponse(register: response)
        
        print("📦 [Repo] Mapping terminé")
        return mapped
    }
    
    func deleteChallengeForToday(challengeID: UUID) async throws -> DeleteResponse{
        _ = try await  service.deleteChallengeOfTheDay(challengeId: challengeID)
        return DeleteResponse(success: true)
    }
}
