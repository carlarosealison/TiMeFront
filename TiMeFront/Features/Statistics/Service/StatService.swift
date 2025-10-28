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
        // Si token disponible dans AuthViewModel, utilise-le
        if let token = authVM?.token {
            return try await apiService.getToken(endpoint: "/users/pages", as: StatDTO.self)
        } else {
            throw NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Token non disponible. Connectez-vous."])
        }
    }
}

