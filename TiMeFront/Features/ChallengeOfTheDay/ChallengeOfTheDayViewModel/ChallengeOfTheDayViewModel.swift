//
//  ChallengeOfTheDayViewModel.swift
//  TiMeFront
//
//  Created by Carla on 20/10/2025.
//

import Foundation

@Observable
class ChallengeOfTheDayViewModel : @unchecked Sendable {
    
    var challengeOTD : ChallengeOfTheDayResponseDTO?
    private let challengeOTDRepo = ChallengeOfTheDayRepo()
    
    var challenge : ChallengeModel?
    private let challengeRepo = ChallengeRepo()
    
    var authViewModel : AuthViewModel
    
    init(challengeOTD: ChallengeOfTheDayResponseDTO? = nil, challenge: ChallengeModel? = nil, authViewModel: AuthViewModel) {
        self.challengeOTD = challengeOTD
        self.challenge = challenge
        self.authViewModel = authViewModel
    }
    
    func createRandomChallenge() async throws {
        print("🎲 [ViewModel] === Création nouveau challenge ===")
        
        guard let userId = authViewModel.currentUser?.id else {
            print("❌ [ViewModel] Pas d'utilisateur connecté")
            throw URLError(.userAuthenticationRequired)
        }
        
        print("👤 [ViewModel] User ID: \(userId)")
        
        do {
            let response = try await challengeOTDRepo.createRandomChallengeOfTheDay(userId: userId)
            
                // ✅ Map vers le DTO avec UUID directs
            challengeOTD = ChallengeOfTheDayResponseDTO(
                id: response.id ?? UUID(),
                dateExp: response.dateExp,
                instruction: response.instructionOTD,
                messageMotivation: response.messageMotivationOTD,
                id_user: response.idUser,      // ✅ UUID direct
                id_challenge: response.idChallenge  // ✅ UUID direct
            )
            
            print("✅ [ViewModel] Challenge créé et assigné")
            print("   Instruction: \(challengeOTD!.instruction)")
            
        } catch {
            print("❌ [ViewModel] Erreur: \(error)")
            throw error
        }
    }
    
    func fetchRandomChallengeOfTheDay() async throws {
        print("🎲 [Challenge] === DÉBUT fetchRandomChallengeOfTheDay ===")

        guard let userId = authViewModel.currentUser?.id else {
            print("❌ [Challenge] Pas d'utilisateur connecté")
            return
        }
        
        print("👤 [Challenge] User ID: \(userId)")
        
        do{
            print("📡 [Challenge] Appel de getChallengeOfTheDay()...")

            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            
            print("✅ [Challenge] Challenge récupéré:")
            print("   ID: \(challengeOfTheDay.id)")
            print("   Instruction: \(challengeOfTheDay.instruction)")
            print("   User ID: \(challengeOfTheDay.id_user)")
            
            if challengeOfTheDay.id_user == userId {
                print("✅ [Challenge] Le challenge appartient au user connecté")
            challengeOTD = challengeOfTheDay
            } else {
                print("⚠️ [Challenge] ATTENTION : Ce challenge appartient à un autre user !")
                print("   Attendu: \(userId)")
                print("   Reçu: \(challengeOfTheDay.id_user)")
            }
        }
        
        catch{
            print("Erreur lors du fetch : \(error.localizedDescription)")
        }
        print("🎲 [Challenge] === FIN fetchRandomChallengeOfTheDay ===")

    }
    
    
}

