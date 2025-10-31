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
          // Vérifie que le token est présent
          guard let token = authVM?.token else {
              throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
          }

          // Passe le token à la requête
          return try await apiService.getToken(endpoint: "/users/pages", token: token, as: StatDTO.self)
      }
    
    
    func getCountNote() async throws -> StatDTO {
          // Vérifie que le token est présent
          guard let token = authVM?.token else {
              throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
          }
          return try await apiService.getToken(endpoint: "/users/notes", token: token, as: StatDTO.self)
      }
    
    func getAverageMotivation() async throws -> StatDTO {
          // Vérifie que le token est présent
          guard let token = authVM?.token else {
              throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
          }
          return try await apiService.getToken(endpoint: "/users/average", token: token, as: StatDTO.self)
      }
    
    
    func getEmotionStats() async throws -> [EmotionCategoryStatsResponseDTO] {
          guard let token = authVM?.token else {
              throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
          }
          return try await apiService.getToken(endpoint: "/users/emotionStats", token: token, as: [EmotionCategoryStatsResponseDTO].self)
      }
}

