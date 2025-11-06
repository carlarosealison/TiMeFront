//
//  StatService.swift
//  TiMeFront
//
//  Created by apprenant152 on 28/10/2025.
//

import Foundation

struct StatService {
    
    let apiService = APIService.shared
    var authVM: AuthViewModel? // Injection du AuthViewModel

    func getCountPage() async throws -> StatDTO {
        guard let token = authVM?.token else {
            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
        }
        return try await apiService.getToken(endpoint: "/users/pages", token: token, as: StatDTO.self)
    }
    
    func getCountNote() async throws -> StatDTO {
        guard let token = authVM?.token else {
            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
        }
        return try await apiService.getToken(endpoint: "/users/notes", token: token, as: StatDTO.self)
    }
    
    func getAverageMotivation() async throws -> StatDTO {
        guard let token = authVM?.token else {
            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
        }
        return try await apiService.getToken(endpoint: "/users/average", token: token, as: StatDTO.self)
    }
    
    // ✅ AJOUT du paramètre period
    func getEmotionStats(period: String = "week") async throws -> [EmotionCategoryStatsResponseDTO] {
        guard let token = authVM?.token else {
            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
        }
        
        // Construction de l'endpoint avec le paramètre period
        let endpoint = "/users/emotionStats?period=\(period)"
        print("🌐 API Call: \(endpoint)")
        
        let result = try await apiService.getToken(endpoint: endpoint, token: token, as: [EmotionCategoryStatsResponseDTO].self)
        print("📦 API Response: \(result.count) items")
        
        return result
    }
}

