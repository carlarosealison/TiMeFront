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
        return try await service.createRandomChallengeOfTheDay(userId: userId)
    }
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO {

        let response = try await service.getChallengeOfTheDay()
        
        let mapped = mapper.mapChallengeOfTheDayResponse(register: response)
        
        return mapped
    }
    
    func deleteChallengeForToday(challengeID: UUID) async throws -> DeleteResponse{
        _ = try await  service.deleteChallengeOfTheDay(challengeId: challengeID)
        return DeleteResponse(success: true)
    }
}
