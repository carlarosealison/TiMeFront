//
//  ChallengeOfTheDayRepo.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
//

import Foundation

class ChallengeOfTheDayRepo {
    
    private let service = ChallengeOfTheDayService()
    private let mapper = ChallengeOfTheDayMapper()
    
    
    func postRandomChallengeOfTheDay(dateExp: Date, instruction : String, messageMotivation : String, id_user: UUID, id_challenge: UUID) async throws -> ChallengeOfTheDayModel {
        
        let request = ChallengeOfTheDayRequestDTO(dateExp: dateExp, instruction: instruction, messageMotivation: messageMotivation, id_user: id_user, id_chellenge: id_challenge)
        
        let response = try await service.postRandomChallengeOfTheDay(challengeOTD: request)
        return mapper.mapChallengeOfTheDayResponse(register: response)
    }
    
    func getChallengeOfTheDay()async throws -> ChallengeOfTheDayModel {
        let response = try await service.getChallengeOfTheDay()
        return mapper.mapChallengeOfTheDayResponse(register: response)
        
    }
    
//    func deleteChallengeForToday() async throws {
//        let response = try await service.
//        return mapper.mapChallengeOfTheDayResponse(register: response)
//    }
}
