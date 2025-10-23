//
//  ChallengeOfTheDayViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 20/10/2025.
//

import Foundation

@Observable
class ChallengeOfTheDayViewModel : @unchecked Sendable {
    
    var challengeOTD : ChallengeOfTheDayModel?
    private let challengeOTDRepo = ChallengeOfTheDayRepo()
    
    var challenge : ChallengeModel?
    private let challengeRepo = ChallengeRepo()
    
    var authViewModel : AuthViewModel
    
    init(challengeOTD: ChallengeOfTheDayModel? = nil, challenge: ChallengeModel? = nil, authViewModel: AuthViewModel) {
        self.challengeOTD = challengeOTD
        self.challenge = challenge
        self.authViewModel = authViewModel
    }
    
    func fetchRandomChallengeOfTheDay() async throws {
        
        do{
            //je récupre le challenge en .random
            let challengeIndex = try await challengeRepo.randomChallenge()
            
            // je post le challenge récupéré afin de l'assigner comme challenge du jour
            let postChallengeOTD = try await challengeOTDRepo.postRandomChallengeOfTheDay(dateExp: Date.now, instruction: challengeIndex.instruction, messageMotivation: challengeIndex.messageMotivation, id_user: authViewModel.currentUser?.id ?? UUID(), id_challenge: challengeIndex.id)
            
            // je récupère le challenge du jour pour l'injecter dans mon UI
            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            
            if challengeOfTheDay.dateExp == Date.now {
                let _ = try await challengeOTDRepo.getChallengeOfTheDay()
            }
            else {
                
            }
            
            
            DispatchQueue.main.async {
//                self.challengeOTD = challengeOfTheDay
                self.challengeOTD = postChallengeOTD
            }
        }
        
        catch{
            print("Erreur lors du fetch : \(error)")
        }
    }
}
