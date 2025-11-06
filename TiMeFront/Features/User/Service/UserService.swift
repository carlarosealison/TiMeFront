//
//  UserService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct UserService{
    private let api = APIService()
    
    func login(user: UserLogin) async throws -> String {
        let url = URL(string: "http://10.80.59.29:8080/users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(user)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        guard let token = String(data: data, encoding: .utf8) else {
            throw URLError(.cannotDecodeRawData)
        }
        return token.replacingOccurrences(of: "\"", with: "")
    }
    
    func createUser(user: UserRequest)async throws->UserResponse{
        try await api.post(endpoint: "users", body: user)
    }
    

    func patchStreak(streak: UserStreakDTO, token: String) async throws -> UserStreakResponseDTO {
        return try await api.patch(endpoint: "users/streak", token: token, body: streak)
    }

    

    func updateUser(userRequest: UserRequest) async throws -> UserResponse {
        try await api.put(endpoint: "users", body: userRequest)
    }
    
    func patchChallenge(challengeNumber: Int, token: String) async throws -> UserChallengeResponseDTO {
           let body = UserChallengeDTO(challengeNumber: challengeNumber)
           return try await api.patch(endpoint: "users/challenge", token: token, body: body)
       }
    
}
