//
//  ChallengeViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import Foundation

@MainActor
@Observable

class ChallengeViewModel: @unchecked Sendable {
    
    var challenge : ChallengeModel?
    var isChallengeCompleted: Bool = false
    var isLoading = false
    var errorMessage: String?
    
    var authViewModel: AuthViewModel?
    
    private let challengeRepo = ChallengeRepo()
    private let challengeOfTheDayRepo = ChallengeOfTheDayRepo()
    
    func fetchRandomChallenge() async {
        guard let userId = authViewModel?.currentUser?.id else {
            print("❌ [Challenge] Pas d'utilisateur connecté")
            return
        }
        
        isLoading = true
        
        do {
            let challengeOTD = try await challengeOfTheDayRepo.createRandomChallengeOfTheDay(userId: userId)
            
            self.challenge = ChallengeModel(
                id: challengeOTD.idChallenge,
                instruction: challengeOTD.instructionOTD,
                messageMotivation: challengeOTD.messageMotivationOTD
            )
            self.isChallengeCompleted = false
            
            print("✅ [Challenge] Challenge créé: \(challengeOTD.instructionOTD)")
            
        } catch {
            print("❌ [Challenge] Erreur: \(error)")
            errorMessage = "Erreur de chargement"
        }
        
        isLoading = false
    }
    
    // MARK: - Valider le challenge
    func completeChallenge() async {
        guard challenge != nil else { return }
        self.isChallengeCompleted = true
        print("✅ [Challenge] Challenge validé!")
    }
    
    // MARK: Compléter/abandonner le challenge
    func finishChallenge() {
        challenge = nil
        isChallengeCompleted = false
    }
}
