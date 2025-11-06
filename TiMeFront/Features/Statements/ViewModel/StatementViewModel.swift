//
//  StatementViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//


import SwiftUI

@Observable
class StatementViewModel {
    var dailyStatement: StatementResponse?
    var isLoading = false
    var errorMessage: String?
    
    @MainActor
    func fetchDailyStatement() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "http://10.80.59.29:8080/statements/daily") else {
            errorMessage = "URL invalide"
            isLoading = false
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                errorMessage = "Aucune donnée disponible"
                isLoading = false
                return
            }
            
            let statement = try JSONDecoder().decode(StatementResponse.self, from: data)
            self.dailyStatement = statement
            
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
            print("Erreur récupération statement : \(error)")
        }
        
        isLoading = false
    }
}
