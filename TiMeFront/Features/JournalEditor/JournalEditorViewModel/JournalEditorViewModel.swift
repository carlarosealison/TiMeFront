//
//  JournalEditorViewModel.swift
//  TiMeFront
//
//  Created by Carla on 22/10/2025.
//

import Foundation

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
    func fetchEmotion(){
        
    }
    
    //MARK: - Rédaction du jour
    var showSheet : Bool = false
    
    var textOfTheDay = ""
    
    //MARK: - ScrollMotivation
    var value : Int = 0
    var tempValue : Int = 0
    var dragOffset : CGFloat = 0
    
    let range: ClosedRange<Int> = 0...100
    let stepWidth: CGFloat = 10
    
    
}
