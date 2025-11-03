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
    
    func createRandomChallengeOfTheDay() async throws -> ChallengeOfTheDayResponse {
        return try await service.createRandomChallengeOfTheDay()
    }
    
//    func postRandomChallengeOfTheDay(dateExp: Date, instruction : String, messageMotivation : String, id_user: UUID, id_challenge: UUID) async throws -> ChallengeOfTheDayRequestDTO {
//        
//        let request = ChallengeOfTheDayRequestDTO(dateExp: dateExp, instruction: instruction, messageMotivation: messageMotivation, id_user: id_user, id_challenge: id_challenge)
//        
//        let response = try await service.postRandomChallengeOfTheDay(userID: request.id_user)
//        return mapper.mapChallengeOfTheDayRequest(register: response)
//    }
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO {
        let response = try await service.getChallengeOfTheDay()
        return mapper.mapChallengeOfTheDayResponse(register: response)
        
    }
    
    func deleteChallengeForToday(challengeID: UUID) async throws -> DeleteResponse{
        _ = try await  service.deleteChallengeOfTheDay(challengeId: challengeID)
        return DeleteResponse(success: true)
    }
}
