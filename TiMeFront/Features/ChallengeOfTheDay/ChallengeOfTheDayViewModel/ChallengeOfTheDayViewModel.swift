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
    
    func fetchRandomChallengeOfTheDay() async throws {
        do{
            let challengeOfTheDay = try await challengeOTDRepo.getChallengeOfTheDay()
            challengeOTD = challengeOfTheDay

            
//            DispatchQueue.main.async {
//                self.challengeOTD = postChallengeOTD
//                self.challengeOTD = finalChallengeOfTheDay
//            }
        }
        
        catch{
            print("Erreur lors du fetch : \(error.localizedDescription)")
        }
        
    }
    
    
}

