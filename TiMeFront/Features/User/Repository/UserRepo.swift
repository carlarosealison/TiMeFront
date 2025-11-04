//
//  UserRepo.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct UserRepo{
    
     let service = UserService()
     let mapper = UserMapper()
    
    
    func creatUser(firstName: String, lastName: String, userName: String, email: String, password: String, imageProfil: String) async throws -> UserResponse{
        let request = UserRequest(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password, imageProfil: imageProfil)
        return try await service.createUser(user: request)

    }
    
    func login(email: String?, username: String?, password: String) async throws -> String {
        let request = UserLogin(email: email, username: username, password: password)
        return try await service.login(user: request)
    }
    
    func updateUser(firstName: String, lastName: String, userName: String, email: String, password: String, imageProfil: String?) async throws -> UserResponse {
        
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let updateData = UserRequest(
            firstName: firstName,
            lastName: lastName,
            userName: userName,
            email: email,
            password: password,
            imageProfil: imageProfil
        )
        
        var request = URLRequest(url: APIService.shared.baseURL.appendingPathComponent("users/update"))
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        request.httpBody = try encoder.encode(updateData)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let user = try decoder.decode(UserResponse.self, from: data)
        
        return user
    }
    
    func patchStreak(streak: Int, token: String) async throws -> UserStreakResponseDTO {
        let request = UserStreakDTO(streakNumber: streak)
        return try await service.patchStreak(streak: request, token: token)
    }


}
