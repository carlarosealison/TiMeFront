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
        
        
        do{
            //je récupre le challenge en .random
            let challengeIndex = try await challengeRepo.randomChallenge()
            
            // je post le challenge récupéré afin de l'assigner comme challenge du jour
            // let postChallengeOTD
            _ = try await challengeOTDRepo.postRandomChallengeOfTheDay(dateExp: Date.now, instruction: challengeIndex.instruction, messageMotivation: challengeIndex.messageMotivation, id_user: authViewModel.currentUser?.id ?? UUID() , id_challenge: challengeIndex.id)
            
            //je récupère mon challenge of the day créé juste avant
            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            
            DispatchQueue.main.async {
                self.challengeOTD = challengeOfTheDay
            }
            
            //je vérifie que le challenge instencié comme challenge du jour n'a pas dépassé la date du jour
            let isToday = Calendar.current.isDateInToday(challengeOfTheDay.dateExp)
            
            if isToday {
                return .challenge(challengeOfTheDay)
            }
            
            // autrement, je le supprime en tant que challenge du jour
            else {
                //let challengeOutOfDate
                _ = try await challengeOTDRepo.deleteChallengeForToday(challengeID: challengeOfTheDay.id)
                self.challengeOTD = nil
                
                return .delete(DeleteResponse(success: true))
            }
            
            
            
        }
        
        catch{
            print("Erreur lors du fetch : \(error)")
            return .error(URLError(.unknown))
        }
    }
}
