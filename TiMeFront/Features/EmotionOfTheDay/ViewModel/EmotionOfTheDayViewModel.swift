//
//  EmotionOfTheDayViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 08/10/2025.
//

import Foundation

@MainActor
@Observable
class EmotionOfTheDayViewModel {
    // States
    var isLoading: Bool = false
    var errorMessage: String?
    var showSuccess: Bool = false
    var currentEmotion: EmotionOfTheDayModel?
    var dailyEmotion: EmotionModel?
    
    // Dependencies
    private let emotionOfTheDayRepo = EmotionOfTheDayRepo()
    private let emotionRepo = EmotionRepo()
    private let testUserId = UUID(uuidString: "AEFC2553-7B2D-4B11-B378-BFDCE0C3C4E1")!
    
    // Charger l'émotion du jour
    func loadDailyEmotion() async {
        do {
            dailyEmotion = try await emotionRepo.getDailySuggestion()
        } catch {
            print("Erreur chargement émotion du jour : \(error)")
            errorMessage = "Impossible de charger l'émotion du jour"
        }
    }
    
    func addEmotionOfTheDay() async {
        guard let dailyEmotion = dailyEmotion else {
            errorMessage = "L'émotion du jour n'est pas encore chargée"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let emotionOfTheDay = EmotionOfTheDayCreate(
                userID: testUserId,
                emotionID: dailyEmotion.id
            )
            
            currentEmotion = try await emotionOfTheDayRepo.addEmotion(emotionOfTheDay)
            
            showSuccess = true
            try await Task.sleep(nanoseconds: 2_000_000_000)
            showSuccess = false
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
