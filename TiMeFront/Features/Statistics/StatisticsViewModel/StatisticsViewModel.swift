//
//  StatisticsViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 17/10/2025.
//

import SwiftUI

@Observable
class StatisticsViewModel{
    
    var dateSelect : DateType = .week
    var isShowPopCategoryEmotion: Bool = false
    
    enum DateType {
        case week
        case month
        case year
    }
    
    enum StatsType{
        case chart
        case card
    }
    
    
}
