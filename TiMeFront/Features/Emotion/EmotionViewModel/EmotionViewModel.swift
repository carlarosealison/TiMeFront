//
//  EmotionViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 27/10/2025.
//

import Foundation

struct EmotionViewModel: @unchecked Sendable{
    var emotion : EmotionModel?
    private let emotionRepo = EmotionRepo()
    
    mutating func fetchRandomEmotions() async throws {
//        do{
//            let emotions = try await emotionRepo.getRandomEmotions()
//            var randomEmotions : [EmotionModel] = []
//            randomEmotions.append(emotions)
//            
//            DispatchQueue.main.async {
//                self.emotion = randomEmotions
//            }
//        }catch{
//            
//        }
    }}
