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
    
    func fetchRandomChallengeOfTheDay() async throws -> ChallengeOfTheDayResult {
        
        let challengeIndex = try await challengeRepo.randomChallenge()
        let finalChallengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
        _ = try await challengeOTDRepo.deleteChallengeForToday(challengeID: challengeIndex.id)

        do{
            //je récupre le challenge en .random
            let challengeIndex = try await challengeRepo.randomChallenge()
            
            // je post le challenge récupéré afin de l'assigner comme challenge du jour
            let postChallengeOTD = try await challengeOTDRepo.postRandomChallengeOfTheDay(dateExp: Date.now, instruction: challengeIndex.instruction, messageMotivation: challengeIndex.messageMotivation, id_user: authViewModel.currentUser?.id ?? UUID() , id_challenge: challengeIndex.id)
            
            DispatchQueue.main.async {
                self.challengeOTD = postChallengeOTD
                self.challengeOTD = finalChallengeOfTheDay
            }
            
            // je récupère le challenge du jour pour l'injecter dans mon UI
            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            
            //je vérifie que le challenge instencié comme challenge du jour n'a pas dépassé la date du jour
            if challengeOfTheDay.dateExp == Date.now {
                return .challenge(finalChallengeOfTheDay)
            }
            
            // autrement, je le supprime en tant que challenge du jour
            else {
                _ = try await challengeOTDRepo.deleteChallengeForToday(challengeID: challengeIndex.id)
                return .delete(DeleteResponse(success: true))
            }
            
            
            
        }
        
        catch{
            print("Erreur lors du fetch : \(error)")
            return .error(URLError(.unknown))
        }
    }
}
