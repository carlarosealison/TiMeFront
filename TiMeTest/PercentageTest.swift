//
//  PercentageTest.swift
//  TiMeTest
//
//  Created by Carla on 06/11/2025.
//

import XCTest

@testable import TiMeFront

final class PercentageTest : XCTestCase {
    
    var percentageStandard : Percentage!


    
    func test_calculatingEmotionPart_withLowEmotionNumberAndTotalEmotions_shouldReturnEmotionPercentage() throws {
        
        let percentageStandard = Percentage(emotionTitle: "Joie", emotionNumber: 2, totalEmotions: 10)
        
        //GIVEN
//        let emotionNumber = 2
//        let totalEmotions = 10
        let expectedPercentage = 20.0
        
        //WHEN
        let result = percentageStandard.calculatingEmotionPart(emotionNumber: percentageStandard.emotionNumber, totalEmotions: percentageStandard.totalEmotions)
        
        //THEN
        XCTAssertEqual(result, expectedPercentage, "2 émotions ont été ressenties, le résultat est de 20.0 soit un pourcentage de 20%")
        
    }
    
    func test_calculatingEmotionPart_withNegativeEmotionNumberAndTotalEmotions_shouldNotBeNegative () throws{
        let percentageStandard = Percentage(emotionTitle: "Tristesse", emotionNumber: -2, totalEmotions: 20)
        
        //GIVEN
//        let emotionNumber = -2
//        let totalEmotions = 20
        let expectedPercentage = 0.0
        
        //WHEN
        let result = percentageStandard.calculatingEmotionPart(emotionNumber: percentageStandard.emotionNumber, totalEmotions: percentageStandard.totalEmotions)
        
        //THEN
        XCTAssertLessThan(result, expectedPercentage, "Le résultat de nombre négatif d'émotion ressentis, ne doit pas être inférieur à 0.0, soit 0% ")
    }
    
}
