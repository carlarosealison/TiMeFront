//
//  PrivateJournalViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import Foundation

@Observable
final class PrivateJournalViewModel {
    
    // MARK: - Propriétés
    
    var week: Week?
    var isLoading = false
    var errorMessage: String?
    
    var weekNumber: Int
    var month: Int
    var year: Int
    
    // MARK: - Init
    
    init(weekNumber: Int, month: Int, year: Int) {
        self.weekNumber = weekNumber
        self.month = month
        self.year = year
    }
    
    // MARK: - Chargement des données
    
    /// Charge les données de la semaine depuis l'API
    func loadWeek() async {
        isLoading = true
        errorMessage = nil
        
        do {
            // Récupère l'userId
            let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
            
            guard !userId.isEmpty else {
                errorMessage = "Utilisateur non connecté"
                isLoading = false
                return
            }
            
            // Charge toute la semaine avec la méthode statique
            self.week = try await Week.load(
                weekNumber: weekNumber,
                month: month,
                year: year,
                userId: userId,
                apiService: APIService()
            )
            
            print("✅ Semaine chargée avec succès")
            
        } catch {
            errorMessage = "Erreur lors du chargement"
            print("❌ Error loading week: \(error)")
        }
        
        isLoading = false
    }
}
