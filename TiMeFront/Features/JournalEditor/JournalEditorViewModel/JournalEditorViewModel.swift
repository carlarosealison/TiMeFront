//
//  JournalEditorViewModel.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import Foundation

struct JournalEditorViewModel {
    
    //MARK: - FetchEmotion pour les MoodValidationSticks
    func fetchEmotion(){
        
    }
    
    //MARK: - ScrollMotivation
    
    var value : Int = 0
    var tempValue : Int = 0
    var dragOffset : CGFloat = 0
    
    let range: ClosedRange<Int> = 0...100
    let stepWidth: CGFloat = 10
    
    
}
