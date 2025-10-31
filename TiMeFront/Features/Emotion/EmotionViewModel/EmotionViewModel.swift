//
//  EmotionViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 27/10/2025.
//

import Foundation

@Observable
class EmotionViewModel: @unchecked Sendable{
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
                print("error whule fetching: \(error.localizedDescription)")
            }
            
        }.resume()
    }

    }
