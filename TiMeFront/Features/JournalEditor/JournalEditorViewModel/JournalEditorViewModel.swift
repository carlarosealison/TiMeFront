//
//  JournalEditorViewModel.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import Foundation
import SwiftUI

@Observable
class JournalEditorViewModel {

    //MARK: - Date du jour
    var today = Date().formattedFrench()
    
    //MARK: - Heart Manager
    var sliderHeight : CGFloat = 0
    var sliderProgress : CGFloat = 0
    var heartMaxHeight : CGFloat = 105
    
    var lastDragValue : CGFloat = 0
    //MARK: - FetchEmotion pour les MoodValidationSticks
    var randomEmotions : [EmotionResponseDTO] = []
    
    func fetchRandomEmotions() {
        guard let url = URL(string: "http://127.0.0.1:8080/emotion/random") else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do{
                    let decodedEmotions = try JSONDecoder().decode([EmotionResponseDTO].self, from: data)
                    DispatchQueue.main.async {
                        self.randomEmotions = decodedEmotions
                    }
                }
                catch{
                    print("error while decoding data: \(error.localizedDescription)")
                }
            }
            else if let error = error {
                print("error while fetching: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
    //MARK: - Rédaction du jour
    var showSheet : Bool = false
    var textOfTheDay = ""
    var showAlert : Bool = false
    var messageAlert = ""
    var user : AuthViewModel
    
    init(user : AuthViewModel) {
        self.user = user
    }
    
    func postTextOfTheDay() async {
        //je prends l'url corrspondant la route que je veux lier
        guard let url = URL(string: "http://127.0.0.1:8080/page/create") else { return }
        
        //j'ajoute les headers nécessaire au bon fonctionnement de ma requête
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = user.token {
            request.addValue("Bearer: \(token)", forHTTPHeaderField: "Authorization")
        }else {
            print("Aucun token disponible")
        }
        
        //j'instancie le nouvel object à encode en JSON qui sera envoyé vers le back
        let newTextOfTheDay = PageRequestDTO(idUser: user.currentUser?.id ?? UUID(), note: textOfTheDay)
        request.httpBody = try? JSONEncoder().encode(newTextOfTheDay)
        
        //exécution de la requête -> à réaliser dans un do{}catch{}
        do{
            //requête
            let (data, response) = try await URLSession.shared.data(for: request)
            
            //envoi de la httpResponse correspondante
            if let httpResponse = response as? HTTPURLResponse {
                if (200 ... 299).contains(httpResponse.statusCode){
                    messageAlert = "La note du jour a bien été enregistré!"
                    showAlert = true
                    
                }else{
                    messageAlert = "Erreur lors de l'envoi de la note du jour.\n Erreur: \(httpResponse.statusCode)"
                    showAlert = true

                }
            }
            //print pour débug console
            print(String(data: data, encoding: .utf8) ?? "")
            
        }catch{
            
            // le catch en cas de refus d'exécution de la requête
            messageAlert = "Erreur de reseau: \(error.localizedDescription)"
            showAlert = true

        }
  
    }
    
    //    @MainActor
    //    func postTextOfTheDay(textOfTheDay: PageRequestDTO) {
    //
    //        guard let url = URL(string: "http://localhost:8080/page/create") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //        request.addValue("", forHTTPHeaderField: "Authorization")
    //
    //            do{
    //                let jsonData = try JSONEncoder().encode(textOfTheDay)
    //                request.httpBody = jsonData
    //            }catch{
    //                print("error while encoding text of the day: \(error.localizedDescription)")
    //            }
    //
    //
    //            URLSession.shared.dataTask(with: request) { data, response, error in
    //
    //                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201, let data = data else{
    //                    print("error with status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
    //                    return
    //                }
    //
    //                do{
    //                    let createdTextOfTheDay = try JSONDecoder().decode(PageRequestDTO.self, from: data)
    //                    print("New textOfTheDay successfully added!")
    //                    print("created textOfTheDay: \(createdTextOfTheDay)")
    //
    //                }catch{
    //                    print("error while decode response: \(error.localizedDescription)")
    //
    //                }
    //
    //                if let error = error {
    //                    print("error while sending TextOfTheDay: \(error.localizedDescription)")
    //                    return
    //                }
    //
    //            return
    //        }.resume()
    //
    //
    //    }
    
    //    @MainActor
    //    func submitTextOfTheDay(){
    //        guard !textOfTheDay.isEmpty else {
    //            //TODO: mettre en place une alert dans le font pour prévenir les users que le textOfTheDay n'est pas rempli
    //            showAlert = true
    //            return
    //        }
    //        let textOfTheDay = PageRequestDTO(idUser: user.currentUser?.id ?? UUID() , note: textOfTheDay)
    //        postTextOfTheDay(textOfTheDay: textOfTheDay
    //         )
    //    }
    
    //MARK: - ScrollMotivation
    var value : Int = 0
    var tempValue : Int = 0
    var dragOffset : CGFloat = 0
    
    let range: ClosedRange<Int> = 0...100
    let stepWidth: CGFloat = 10
    
    
}
