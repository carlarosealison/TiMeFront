//
//  RegisterModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import Foundation


@Observable
class ChallengeViewModel: @unchecked Sendable {
    var challenge : ChallengeModel?
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
        do {
            let challengeIndex = try await challengeRepo.randomChallenge()
                        
            DispatchQueue.main.async {
                self.challenge = challengeIndex
            }
            // pour une mise à jour sur le thread principal -> autrement Swift plante
        }
        catch{
            print("Erreur lors du fetch : \(error)")
        }
    }
    

}
