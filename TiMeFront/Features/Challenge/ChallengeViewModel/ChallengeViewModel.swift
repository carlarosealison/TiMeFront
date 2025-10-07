//
//  RegisterModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import Foundation


@Observable
class ChallengeViewModel: @unchecked Sendable {
    //étape 4: mettre en place le view Model qui fait l'intermédiaire entre le Model et la View
    var challenge : ChallengeModel?
    private let mapper = ChallengeMapper()

    func fetchChallenge() async {
        // création de l'URL qui dirige vers l'API où trouver un challenge , si null -> return
        guard let url = URL(string: "http://127.0.0.1:8080/challenge/947B1CD3-8226-4BAF-8C0D-3717FB90F79C") else { return }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)// afin d'obtenir les données en JSON
            let challengeDTO = try JSONDecoder().decode(ChallengeResponseDTO.self, from: data)//ici on décode le JSON en challengeResponseDTO
            let challengeModel = mapper.mapChallengeResponse(register: challengeDTO) //le DTO est passé au mapper pour le mettre sous forme de ChallengeModel
            DispatchQueue.main.async {
                self.challenge = challengeModel
            } // pour une mise à jour sur le thread principal -> autrement Swift plante
        }
        catch {
            print("Erreur lors du fetch : \(error)")
        }
    }
    

}
