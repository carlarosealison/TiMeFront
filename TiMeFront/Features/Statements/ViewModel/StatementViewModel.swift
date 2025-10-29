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
        
        guard let url = URL(string: "http://127.0.0.1:8080/statements/daily") else {
            errorMessage = "URL invalide"
            isLoading = false
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                errorMessage = "Erreur serveur"
                isLoading = false
                return
            }
            
            let statement = try JSONDecoder().decode(StatementResponse.self, from: data)
            self.dailyStatement = statement
            
            print("✅ Statement du jour : \(statement.sentence)")
            
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
            print("❌ Erreur récupération statement : \(error)")
        }
        
        isLoading = false
    }
}