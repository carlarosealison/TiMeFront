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
    let currentUser = AuthViewModel()
    
    var streak : Int = 0
    var challengeNumber: Int = 0
    
    enum DateType {
        case week
        case month
        case year
    }
    
    enum StatsType{
        case chart
        case card
    }
    
    func streakTotal(){
        if let user = currentUser.currentUser{
            self.streak = user.streakNumber
            self.challengeNumber = user.challengeNumber
        }
    }
    
    
}
