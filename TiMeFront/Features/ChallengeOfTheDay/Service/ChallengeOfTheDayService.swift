//
//  ChallengeOfTheDayService.swift
//  TiMeFront
//
//  Created by Carla on 17/10/2025.
//

import Foundation

struct ChallengeOfTheDayService {
    
    private let api = APIService()
    
//    func postRandomChallengeOfTheDay(userID : UUID) async throws -> ChallengeOfTheDayRequestDTO{
//        let challengeOfTheDay : ChallengeOfTheDayRequestDTO
//        try await api.post(endpoint: "challengeOfTheDay/\(userID)", body: challengeOfTheDay)
//    }
    
    func createRandomChallengeOfTheDay(userId: UUID) async throws -> ChallengeOfTheDayResponse {
        print("🌐 [Service] POST /challengeOfTheDay/\(userId)")
        
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let url = api.baseURL
            .appendingPathComponent("challengeOfTheDay")
            .appendingPathComponent(userId.uuidString)
        
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
    
    func getChallengeOfTheDay() async throws -> ChallengeOfTheDayResponseDTO {
            // ✅ 1. Récupère le token
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            print("❌ [Service] Pas de token JWT disponible")
            throw URLError(.userAuthenticationRequired)
        }
        
        print("🌐 [Service] GET /challengeOfTheDay/get_challenge_of_the_day")
        print("🔐 [Service] Token: \(token.prefix(20))...")
        
            // ✅ 2. Utilise getToken au lieu de get
        let result = try await api.getToken(
            endpoint: "/challengeOfTheDay/get_challenge_of_the_day",
            token: token,
            as: ChallengeOfTheDayResponseDTO.self
        )
        
        print("✅ [Service] Challenge reçu:")
        print("   ID: \(result.id)")
        print("   Instruction: \(result.instruction)")
        print("   User ID: \(result.id_user)")
        
        return result
    }
    
//    func deleteChallengeOfTheDay(challengeID: UUID) async throws -> HTTPURLResponse{
//        try await api.delete(endpoint: "challengeOfTheDay/deleteForToday/\(challengeID)")
        
    func deleteChallengeOfTheDay(challengeId: UUID) async throws -> DeleteResponse {
        try await api.delete(endpoint: "challengeOfTheDay/\(challengeId)")
    }
    
}


