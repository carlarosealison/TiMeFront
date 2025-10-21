//
//  ChallengeOfTheDayService.swift
//  TiMeFront
//
//  Created by Apprenant125 on 17/10/2025.
//

import Foundation

struct ChallengeOfTheDayService {
    
    private let api = APIService()
    
    func postRandomChallengeOfTheDay(challengeOTD : ChallengeOfTheDayRequestDTO) async throws -> ChallengeOfTheDayResponseDTO{
        try await api.post(endpoint: "challengeOfTheDay/randomChallengeOTD", body: challengeOTD )
    }
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO{
        try await api.get(endpoint: "challengeOfTheDay/get_challenge_of_the_day", as: ChallengeOfTheDayResponseDTO.self)
    }
    
    func deleteChallengeOfTheDay(challengeID: UUID) async throws -> HTTPURLResponse{
        try await api.delete(endpoint: "challengeOfTheDay/deleteForToday/\(challengeID)")
        
    }
    
}
