//
//  StatisticsViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 17/10/2025.
//

import SwiftUI

@Observable
class StatisticsViewModel {
    var dateSelect: DateType = .week
    var isShowPopCategoryEmotion: Bool = false
    
    // Injection AuthViewModel pour récupérer le token et l'utilisateur
    var authVM: AuthViewModel?
    
    var streak: Int = 1
    var challengeNumber: Int = 1
    var pages: Int = 1
    var notes: Int = 1
    var average: Int = 1
    var emotionCategoryStats : [EmotionCategoryStats] = []
    
    var statRepo: StatRepo?
    
    enum StatCard{
        case pages
        case notes
        case average
    }
    
    enum DateType {
        case week
        case month
        case year
    }
    
    enum StatsType {
        case chart
        case card
    }
    
    func setupRepo() {
        if let authVM = authVM {
            self.statRepo = StatRepo(statService: StatService(authVM: authVM))
        }
    }
    
    func streakTotal() async {
        guard let user = authVM?.currentUser else {
            return
        }
        self.streak = user.streakNumber
        self.challengeNumber = user.challengeNumber
    }
    
    func fetchPageTotal() async {
        guard authVM?.token != nil else {
            return
        }
        guard let repo = statRepo else {
            return
        }
        
        do {
            let countPages = try await repo.getCountPage()
            self.pages = countPages.countData
            
            let countNotes = try await repo.getCountNote()
            self.notes = countNotes.countData
            
            let averageMotivation = try await repo.getAverageMotivation()
            self.average = averageMotivation.countData
            
        } catch {
            print("Erreur récupération statistiques : \(error)")
        }
    }
    
    
    
    
    func fetchEmotionCategoryStat() async {
        guard authVM?.token != nil else {
            return
        }
        guard let repo = statRepo else {
            return
        }
        
        do {
            let emotionCategoryStat = try await repo.getEmotionStats()
            self.emotionCategoryStats = emotionCategoryStat
            
        } catch {
            print("Erreur récupération statistiques : \(error)")
        }
    }
}

