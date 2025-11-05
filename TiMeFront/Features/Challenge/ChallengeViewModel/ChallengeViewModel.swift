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
    private let userService = UserService()
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
                        
        } catch {
            print("❌ [Challenge] Erreur: \(error)")
            errorMessage = "Erreur de chargement"
            self.challenge = nil
        }
        
        isLoading = false
    }
    

    //MARK: - ValidateChallenge
    
    

    // Charge le challenge actuel au démarrage
    func loadCurrentChallenge() async {
        // Pour l'instant, on simule qu'il n'y a pas de challenge
        // Plus tard, tu chargeras depuis le backend le challenge du jour
        challenge = nil
        isChallengeCompleted = false
    }
    
    // Accepter un challenge
    func acceptChallenge(_ selectedChallenge: ChallengeModel) {
        challenge = selectedChallenge
        isChallengeCompleted = false
    }
    

    // Valider le challenge
      func completeChallenge(auth: AuthViewModel) async {
        guard challenge != nil else { return }

        guard let token = auth.token else {
            print("❌ Pas de token → impossible de mettre à jour challengeNumber")
            return
        }

        // On marque le challenge comme complété
        self.isChallengeCompleted = true
        print("✅ Challenge complété !")

        // On incrémente le challenge number localement
        let newValue = (auth.currentUser?.challengeNumber ?? 0) + 1

        do {
            let updatedUser = try await userService.patchChallenge(
                challengeNumber: newValue,
                token: token
            )

            // On met à jour auth.currentUser pour refléter le nouveau challengeNumber
            auth.currentUser?.challengeNumber = updatedUser.challengeNumber

            print("🔥 ChallengeNumber mis à jour côté serveur : \(updatedUser.challengeNumber)")
        } catch {
            print("❌ Erreur mise à jour challengeNumber:", error)
        }
    }

        // On marque le challenge comme complété

    // MARK: - Valider le challenge
    //func completeChallenge() async {
    //   guard challenge != nil else { return }

     //  self.isChallengeCompleted = true
    //}
    
    // MARK: Compléter/abandonner le challenge
    func finishChallenge() {
        challenge = nil
        isChallengeCompleted = false
    }
}
