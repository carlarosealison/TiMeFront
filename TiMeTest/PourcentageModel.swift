//
//  PourcentageModel.swift
//  TiMeTest
//
//  Created by Carla on 06/11/2025.
//

import Foundation


struct Percentage {
    let emotionTitle : String
    let emotionNumber : Int
    let totalEmotions : Int

    init(emotionTitle: String, emotionNumber: Int, totalEmotions: Int) {
        self.emotionTitle = emotionTitle
        self.emotionNumber = emotionNumber
        self.totalEmotions = totalEmotions
    }
    
    func calculatingEmotionPart(emotionNumber : Int, totalEmotions: Int) -> Double {
        guard totalEmotions > 0 else { return 0.0 }
        
        let percentage = (Double(emotionNumber) / Double(totalEmotions)) * 100
        
        return round(percentage * 100) / 100
    }

}
