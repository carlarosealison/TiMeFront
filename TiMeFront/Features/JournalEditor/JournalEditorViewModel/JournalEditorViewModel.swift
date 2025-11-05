//
//  JournalEditorViewModel.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import Foundation
import SwiftUI

@Observable
class JournalEditorViewModel : @unchecked Sendable{
    
    //MARK: - Date du jour
    var today = Date().formattedFrench()
    
    //MARK: - Heart Manager
    var sliderHeight : CGFloat = 0
    var sliderProgress : CGFloat = 0
    var heartMaxHeight : CGFloat = 105
    
    var lastDragValue : CGFloat = 0
    
    func submitHeartLevel () async{
        guard let url = URL(string: "http://127.0.0.1:8080/heartLevel/create") else{ return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = user?.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }else{
            print("token indisponible (heart)")
        }
        
        guard let userIdString = user?.extractUserIdFromJWT(user?.token ?? ""),
        let userId = UUID(uuidString: userIdString) else {
            print("user indisponible (heart)")
            return
        }
        
        do {
            let heartLevel = Int(sliderHeight)
            let newHeartLevel = HeartLevelRequestDTO(level: heartLevel, idUser: userId)
            request.httpBody = try JSONEncoder().encode(newHeartLevel)
            
        }catch{
            
            print("erreur lors de l'encodage du heartLevel: \(error.localizedDescription)")
            return
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode){
                    print("heartLevel envoyé")
                }else{
                    print("erreur lors de l'envoi du heartLevel \nErreur:\(httpResponse.statusCode)")
                }
            }
            
            print(String(data: data, encoding: .utf8) ?? "")
            
            let heartLevelResponse = try JSONDecoder().decode(HeartLevelResponseDTO.self, from: data)
            print(heartLevelResponse.level)
            
        }catch{
            print("erreur d'exécution de la requête du heartLevel : \(error.localizedDescription)")
        }
    }
    
    var heartLevels : [HeartLevelResponseDTO] = []
    
    func fetchHeartLevels() async {
        guard let url = URL(string: "http://127.0.0.1:8080/heartLevel")else{
            print("invalid Url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do{
                    let decodedHeartLevels = try JSONDecoder().decode([HeartLevelResponseDTO].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.heartLevels = decodedHeartLevels
                    }
                    
                }
                catch{
                    print("error while decoding data: \(error.localizedDescription)")
                    return
                }
            }
            else if let error = error {
                print("error while decoding data: \(error.localizedDescription)")
            }

        }.resume()
        
    }
    
    func fetchHeartLevel() {
        if let todayLevel = heartLevels.last(where: {$0.createdAt == Date.now})?.level {
            sliderHeight = CGFloat(todayLevel)
        } else {
            print("todayLevel unavailable")
        }
    }
    
    
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
    
    func submitEmotionOfTheDay(emotionID : UUID) async {
        guard let url = URL(string: "http://127.0.0.1:8080/emotionOfTheDay/create") else {
            print("url invalide")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = user?.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            print("Aucun token disponible (emotion)")
        }
        
        guard let idUserString = user?.extractUserIdFromJWT(user?.token ?? ""),
              let userId = UUID(uuidString: idUserString)
        else {
            print("User indisponible (emotion)")
            return
        }
        
        do{
            let newEmotionOfTheDay = EmotionOfTheDayRequestDTO(
                date: Date(),
                idUser: userId,
                idEmotion: emotionID)
            
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            request.httpBody = try encoder.encode(newEmotionOfTheDay)
            
        }catch{
            print("erreur lors de l'encodage: \(error.localizedDescription)")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode){
                    print("l'émotion du jour a bien été enregistrée")
                }else{
                    print("erreur lors de l'envoi de l'émotion du jour :\n\(httpResponse.statusCode)")
                }
            }
            
            print(String(data: data, encoding: .utf8) ?? "")
            
            let emotionOfTheDayResponse = try JSONDecoder().decode(EmotionOfTheDayResponseDTO.self, from: data)
            print(emotionOfTheDayResponse)
        }catch{
            print("erreur d'exécution de la requête de l'émotion du jour: \(error.localizedDescription)")
        }
        
    }
    
    //MARK: - Fetch Catégories Emotions pour couleur des MoodValidationSticks
    var emotionCategories : [EmotionCategoryResponseDTO] = []
    
    func fetchCatEmotionColor() {
        
        guard let url = URL(string: "http://127.0.0.1:8080/emotion-category") else {
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let data = data {
                do{
                    let decodedEmotions = try JSONDecoder().decode([EmotionCategoryResponseDTO].self, from: data)
                    DispatchQueue.main.async {
                        self.emotionCategories = decodedEmotions
                    }
                    print(data)
                }catch{
                    print("error while decoding data : \(error.localizedDescription)")
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
    var user : AuthViewModel?
    
    
    
    func submitNote() async {
        //je prends l'url corrspondant la route que je veux lier
        guard let url = URL(string: "http://127.0.0.1:8080/page/create") else { return }
        
        //j'ajoute les headers nécessaire au bon fonctionnement de ma requête
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = user?.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }else {
            print("Aucun token disponible (note)")
        }
        
        // je récupère l'id du User
        guard let idUserString = user?.extractUserIdFromJWT(user?.token ?? ""),
              let idUser = UUID(uuidString: idUserString)
        else {
            print("User non trouvé (note) ")
            return
        }
        
        
        do{
            //j'instancie le nouvel object à encoder en JSON qui sera envoyé vers le back
            let newNote = PageRequestDTO(idUser: idUser, note: self.textOfTheDay)
            
            // j'encode mon objet
            request.httpBody = try JSONEncoder().encode(newNote)
            
        }catch{
            print("Erreur lors de l'encodage: \(error.localizedDescription)")
            return
        }
        
        
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
            
            let textOfTheDayResponse = try JSONDecoder().decode(PageResponseDTO.self, from: data)
            print(textOfTheDayResponse.note)
            
        }catch{
            
            // le catch en cas de refus d'exécution de la requête
            messageAlert = "Erreur de reseau: \(error.localizedDescription)"
            showAlert = true
            
        }
        
    }
    
    //MARK: - ScrollMotivation
    var value : Int = 0
    var tempValue : Int = 0
    var dragOffset : CGFloat = 0
    
    let range: ClosedRange<Int> = 0...100
    let stepWidth: CGFloat = 10
    
    func submitMotivation () async{
        //mon url
        guard let url = URL(string: "http://127.0.0.1:8080/motivation/create") else {
            print("Invalid Url")
            return
        }
        
        //mes headers
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = user?.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }else{
            print("aucun token disponible (motivation) ")
        }
        
        // récupération de l'idUser
        guard let idUserString = user?.extractUserIdFromJWT(user?.token ?? ""),
              let idUser = UUID(uuidString: idUserString) else {
            print("User id indisponible (motivation) ")
            return
        }
        
        do{
            
            //instenciation de l'object à envoyer
            let motivation = MotivationRequestDTO(motivation: tempValue, idUser: idUser)
            
            //encodage de mon nouvel objet
            request.httpBody = try JSONEncoder().encode(motivation)
            
        }catch{
            print("Erreur lors de l'encodage de la motivation: \(error.localizedDescription)")
            
        }
        
        //exécution de la requête
        do{
            //requête
            let (data, response) = try await URLSession.shared.data(for: request)
            
            //reponseHttp
            if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode){
                    print("motivation envoyée!")
                }else{
                    print("erreur lors de l'envoi de la motivation: \(httpResponse.statusCode)")
                }
            }
            //print pour debug
            
            print(String(data: data, encoding: .utf8) ?? "")

            let motivationResponse = try JSONDecoder().decode(MotivationResponseDTO.self , from: data)
            print(motivationResponse.motivation)
            
        }catch{
            //catch de refus d'exécution de la requête
            print("erreur d'exécution de la requête de la motivation: \(error.localizedDescription)")
        }
        
    }
    
    
    
    //MARK: - POST -> Enregistrement des infos de JournalEditorView
    var isSaved : Bool = false
    var showMandatory : Bool = false
    
    func submitJournalOfTheDay (){
        //        sliderHeight -> heartlevel
        //        emotion -> emotion with details
        //        textOfTheDay -> page
        //        tempValue -> motivation
        
        
    }
    
}
