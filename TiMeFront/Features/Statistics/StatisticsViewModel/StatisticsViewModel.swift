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
    
    var statRepo: StatRepo?
    
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
            print("⚠️ Utilisateur non connecté")
            return
        }
        self.streak = user.streakNumber
        self.challengeNumber = user.challengeNumber
    }
    
    func fetchPageTotal() async {
        guard authVM?.token != nil else {
            print("⚠️ Token non disponible")
            return
        }
        guard let repo = statRepo else {
            print("⚠️ StatRepo non initialisé")
            return
        }
        
        do {
            let countPages = try await repo.getCountData()
            self.pages = countPages.countData
            print("📄 Nombre de pages récupérées : \(pages)")
        } catch {
            print("❌ Erreur récupération pages : \(error)")
        }
    }
}


