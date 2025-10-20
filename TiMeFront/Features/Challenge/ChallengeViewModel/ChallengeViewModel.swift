//
//  RegisterModel.swift
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
    private let challengeRepo = ChallengeRepo()
    

    //étape 6: mettre en place le viewModel qui fait l'intermédiaire entre le Model(mais ici le Repo -> DTO) et la View
//    func fetchChallenge(id: UUID) async throws {
//        
//        do{
//            let challengeModel = try await challengeRepo.getChallengeById(id: id)
//            
//            DispatchQueue.main.async {
//                self.challenge = challengeModel
//            }
//        }
//        catch {
//            print("Erreur lors du fetch : \(error)")
//        }
//    }
    
    func fetchRandomChallenge() async throws {
        isLoading = true
        do {
            let challengeIndex = try await challengeRepo.randomChallenge()
            challenge = challengeIndex
            isChallengeCompleted = false
                        
            DispatchQueue.main.async {
                self.challenge = challengeIndex
            }
            // pour une mise à jour sur le thread principal -> autrement Swift plante
        }
        catch{
            print("Erreur lors du fetch : \(error)")
            errorMessage = "Erreur de chargement"
        }
        isLoading = false
    }
    
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
    func completeChallenge() async {
        guard challenge != nil else { return }
        
        // TODO: Appeler le backend pour marquer comme complété
        // try await challengeRepo.completeChallenge(challenge.id)
        
        isChallengeCompleted = true
    }
    
    // Terminer/abandonner le challenge
    func finishChallenge() {
        challenge = nil
        isChallengeCompleted = false
    }
}
