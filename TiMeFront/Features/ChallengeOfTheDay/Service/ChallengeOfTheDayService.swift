//
//  ChallengeOfTheDayService.swift
//  TiMeFront
//
//  Created by Carla on 17/10/2025.
//

import Foundation

struct ChallengeOfTheDayService {
    
    private let api = APIService()
    
<<<<<<< HEAD
//    func postRandomChallengeOfTheDay(userID : UUID) async throws -> ChallengeOfTheDayRequestDTO{
//        let challengeOfTheDay : ChallengeOfTheDayRequestDTO
//        try await api.post(endpoint: "challengeOfTheDay/\(userID)", body: challengeOfTheDay)
//    }
=======
    func createRandomChallengeOfTheDay() async throws -> ChallengeOfTheDayResponse {
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let url = api.baseURL.appendingPathComponent("challengeOfTheDay/randomChallengeOTD")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(ChallengeOfTheDayResponse.self, from: data)
    }
    
    func postRandomChallengeOfTheDay(challengeOTD : ChallengeOfTheDayRequestDTO) async throws -> ChallengeOfTheDayResponseDTO{
        try await api.post(endpoint: "challengeOfTheDay/randomChallengeOTD", body: challengeOTD )
    }
>>>>>>> main
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO{
        try await api.get(endpoint: "challengeOfTheDay/get_challenge_of_the_day", as: ChallengeOfTheDayResponseDTO.self)
    }
    
//    func deleteChallengeOfTheDay(challengeID: UUID) async throws -> HTTPURLResponse{
//        try await api.delete(endpoint: "challengeOfTheDay/deleteForToday/\(challengeID)")
        
    func deleteChallengeOfTheDay(challengeId: UUID) async throws -> DeleteResponse {
        try await api.delete(endpoint: "challengeOfTheDay/\(challengeId)")
    }
    
}


