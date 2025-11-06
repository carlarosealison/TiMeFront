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
    var isLoading: Bool = false
    var errorMessage: String?
    var showSuccess: Bool = false
    var currentEmotion: EmotionOfTheDayModel?
    var dailyEmotion: EmotionModel?
    
    private let emotionOfTheDayRepo = EmotionOfTheDayRepo()
    private let emotionRepo = EmotionRepo()
    
    // Charger l'émotion du jour
    func loadDailyEmotion() async {
        do {
            dailyEmotion = try await emotionRepo.getDailySuggestion()
            print("✅ Émotion chargée : \(dailyEmotion?.title ?? "nil")")
        } catch {
            print("[ViewModel] Erreur chargement : \(error)")
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
            // Récupère l'userId de l'utilisateur connecté
            guard let userIdString = UserDefaults.standard.string(forKey: "userId"),
                  let userId = UUID(uuidString: userIdString) else {
                errorMessage = "Utilisateur non connecté"
                isLoading = false
                return
            }

            let emotionOfTheDay = EmotionOfTheDayCreate(
                date: Date(),
                userID: userId,
                emotionID: dailyEmotion.id
            )
            currentEmotion = try await emotionOfTheDayRepo.addEmotion(emotionOfTheDay)
            showSuccess = true
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func deleteEmotionOfTheDay() async {
        guard let currentEmotion = currentEmotion else {
            errorMessage = "Aucune émotion à supprimer"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            try await emotionOfTheDayRepo.deleteEmotion(currentEmotion.id)
            
            // Réinitialise l'état
            self.currentEmotion = nil
            showSuccess = false
            
            print("Émotion du jour supprimée")
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
            print("Erreur suppression : \(error)")
        }
        
        isLoading = false
    }
}
