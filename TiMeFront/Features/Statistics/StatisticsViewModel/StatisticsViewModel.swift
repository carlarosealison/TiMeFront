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
    // injection depuis la View
    var authVM: AuthViewModel?
    
    var streak : Int = 9
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
    
    func streakTotal() async {
        // utilise l'instance injectée
        if let user = authVM?.currentUser {
            self.streak = user.streakNumber
            self.challengeNumber = user.challengeNumber
        } else {
            // Optionnel : reset ou log si pas d'utilisateur
            print("⚠️ authVM non injecté dans StatisticsViewModel")
        }
    }
}
