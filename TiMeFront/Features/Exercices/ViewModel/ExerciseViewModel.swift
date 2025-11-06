//
//  ExerciseViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 29/10/2025.
//

import SwiftUI

@Observable
class ExerciseViewModel {
    var randomExercise: ExerciseResponse?
    var allExercises: [ExerciseResponse] = []
    var isLoading = false
    var errorMessage: String?
    
    private let baseURL = "http://127.0.0.1:8080/exercises"
    
    //MARK: - Récupérer un exercice aléatoire
    @MainActor
    func fetchRandomExercise() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "\(baseURL)/random") else {
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
            
            let exercise = try JSONDecoder().decode(ExerciseResponse.self, from: data)
            self.randomExercise = exercise
            
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
            print("Erreur de la récupération de l'exercice : \(error)")
        }
        
        isLoading = false
    }
    
    //MARK: - Récupérer tous les exercices
    @MainActor
    func fetchAllExercises() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: baseURL) else {
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
            
            let exercises = try JSONDecoder().decode([ExerciseResponse].self, from: data)
            self.allExercises = exercises
            
        } catch {
            errorMessage = "Erreur : \(error.localizedDescription)"
            print("Erreur lors de la récupération des exercices : \(error)")
        }
        
        isLoading = false
    }
}
