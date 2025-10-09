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
    
    // MARK: - States (états observables pour l'UI)
    var isLoading: Bool = false
    var errorMessage: String?
    var currentEmotionOfTheDay: EmotionOfTheDayModel?
    
    // MARK: - Dependencies
    private let repository = EmotionOfTheDayRepo()
    
    // MARK: - Constantes pour les tests
    // TODO: Plus tard, remplacer par AuthManager.currentUserId
    private let testUserId = UUID(uuidString: "AEFC2553-7B2D-4B11-B378-BFDCE0C3C4E1")!
    private let defaultEmotionId = UUID(uuidString: "A37FB50A-4AFC-449F-B243-51BD6079B834")! // Joyeuse
    
    // MARK: - Actions
    
    /// Crée ou met à jour l'émotion du jour
    func addEmotionOfTheDay() async {
        // Reset de l'erreur précédente
        errorMessage = nil
        isLoading = true
        
        do {
            // Créer l'émotion avec la date actuelle
            let emotion = try await repository.createEmotionOfTheDay(
                date: Date(),
                idUser: testUserId,
                idEmotion: defaultEmotionId
            )
            
            // Stocker l'émotion créée
            currentEmotionOfTheDay = emotion
            
            print("✅ Émotion du jour ajoutée avec succès : \(emotion.id)")
            
        } catch {
            errorMessage = "Erreur lors de l'ajout de l'émotion : \(error.localizedDescription)"
            print("❌ Erreur : \(error)")
        }
        
        isLoading = false
    }
}