//
//  EmotionService.swift
//  TiMeFront
//
//  Created by Apprenant125 on 28/10/2025.
//

import Foundation

struct EmotionService {
    
    private let api = APIService()
    
    func getRandomEmotions() async throws -> [EmotionResponseDTO]{
        try await api.get(endpoint: "random", as: [EmotionResponseDTO].self)
        
    }

    
}
