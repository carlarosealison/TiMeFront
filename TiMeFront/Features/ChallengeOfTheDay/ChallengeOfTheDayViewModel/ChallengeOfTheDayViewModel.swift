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
        
        guard let userId = authViewModel.currentUser?.id else {
            throw URLError(.userAuthenticationRequired)
        }
        
        
        do {
            let response = try await challengeOTDRepo.createRandomChallengeOfTheDay(userId: userId)
            
            challengeOTD = ChallengeOfTheDayResponseDTO(
                id: response.id ?? UUID(),
                dateExp: response.dateExp,
                instruction: response.instructionOTD,
                messageMotivation: response.messageMotivationOTD,
                id_user: response.idUser,
                id_challenge: response.idChallenge
            )
        } catch {
            throw error
        }
    }
    
    func fetchRandomChallengeOfTheDay() async throws {

        guard let userId = authViewModel.currentUser?.id else {
            return
        }
        do{
            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            if challengeOfTheDay.id_user == userId {
            challengeOTD = challengeOfTheDay
            } else {
            }
        }
        
        catch{
            print("Erreur lors du fetch : \(error.localizedDescription)")
        }
    }
}
