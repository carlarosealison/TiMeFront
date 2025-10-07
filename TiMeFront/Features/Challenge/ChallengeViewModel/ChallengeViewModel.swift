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
    func fetchChallenge(id: UUID) async {
        
        do{
            let challengeModel = try await challengeRepo.getChallengeById(id: id)
            self.challenge = challengeModel
            
//            DispatchQueue.main.async {
//                self.challenge = challengeModel
//            } // pour une mise à jour sur le thread principal -> autrement Swift plante
        }
        catch {
            print("Erreur lors du fetch : \(error)")
        }
    }
    

}
