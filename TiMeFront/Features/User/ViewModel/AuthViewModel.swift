//
//  AuthViewModel.swift
//  TiMeFront
//
//  Created by apprenant152 on 13/10/2025.
//

import SwiftUI

@Observable
class AuthViewModel {
    var isAuthenticated = false
    var token: String?
    var currentUser: UserResponse?
    var streakUser : Int = 0
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let userRepo = UserRepo()
    private let baseURL = APIService.shared.baseURL
    
    // MARK: - Login utilisateur
    @MainActor
    func login(email: String?, username: String?, password: String) async {
        errorMessage = nil
        isLoading = true
        do {
            let token = try await userRepo.login(email: email, username: username, password: password)
            
            self.token = token
            self.isAuthenticated = true
            UserDefaults.standard.set(token, forKey: "jwtToken")
            
            let userResponse: UserResponse = try await APIService.shared.getToken(
                endpoint: "/users/profile",
                token: token,
                as: UserResponse.self
            )
            
            self.currentUser = userResponse
            self.streakUser = userResponse.streakNumber
            self.isAuthenticated = true
            
        } catch {
            if let urlError = error as? URLError, urlError.code.rawValue == -1011 {
                errorMessage = "Identifiants incorrects"
            } else {
                errorMessage = "Erreur de connexion"
            }
            
            isAuthenticated = false
            print("Erreur login: \(error)")
        }
        
        isLoading = false
    }
    
    // MARK: - Helper : Décoder JWT
    func extractUserIdFromJWT(_ token: String) -> String? {
        // Un JWT est composé de 3 parties séparées par des points : header.payload.signature
        let parts = token.split(separator: ".")
        guard parts.count == 3 else {
            print("Token JWT invalide (pas 3 parties)")
            return nil
        }
        
        // Décode la partie payload (partie 2)
        let payloadPart = String(parts[1])
        
        // Ajoute le padding si nécessaire pour le décodage Base64
        var base64String = payloadPart
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        // Ajoute le padding Base64
        let paddingLength = (4 - base64String.count % 4) % 4
        base64String += String(repeating: "=", count: paddingLength)
        
        // Décode en Data
        guard let decodedData = Data(base64Encoded: base64String) else {
            print("Impossible de décoder le payload JWT en Base64")
            return nil
        }
        
        // Parse le JSON
        do {
            if let json = try JSONSerialization.jsonObject(with: decodedData) as? [String: Any],
               let userId = json["id"] as? String {
                return userId
            } else {
                print("Payload JWT ne contient pas 'id' : \(String(data: decodedData, encoding: .utf8) ?? "non décodable")")
                return nil
            }
        } catch {
            print("Erreur parsing JSON du JWT : \(error)")
            return nil
        }
    }
    
    // MARK: - Déconnexion
    func logout() {
        token = nil
        currentUser = nil
        isAuthenticated = false
        
        UserDefaults.standard.removeObject(forKey: "jwtToken")
        print("✅ Déconnexion réussie")
    }
    
    // MARK: - Récupérer le profil utilisateur connecté
    func fetchUserProfile() async {
        guard let token else { return }
        
        do {
            // Utilise APIService pour gérer automatiquement le baseURL
            let apiService = APIService()
            
            // Crée une requête custom avec le token
            var request = URLRequest(url: apiService.baseURL.appendingPathComponent("users/profile"))
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Erreur profil: statut HTTP invalide")
                return
            }
            
            if String(data: data, encoding: .utf8) != nil {
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user = try decoder.decode(UserResponse.self, from: data)
            
            self.currentUser = user

            
        } catch {
            print("Erreur récupération profil: \(error)")
        }
    }
    
    // MARK: Fonction pour gérer la streak
    func incrementStreakIfNeeded() async {
        guard let token = token else { return }
        guard var currentUser = currentUser else { return }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .current

        let todayString = formatter.string(from: Date())
        let lastConnectionString = UserDefaults.standard.string(forKey: "lastConnectionDay")

        print("lastConnectionDay:", lastConnectionString ?? "aucune", "today:", todayString)

        // Déjà connecté aujourd'hui → rien à faire
        if lastConnectionString == todayString {
            print("Déjà connecté aujourd'hui → streak inchangée")
            return
        }

        var shouldIncrement = false
        var newStreakValue = currentUser.streakNumber

        if let lastDay = lastConnectionString,
           let lastDate = formatter.date(from: lastDay),
           let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()),
           formatter.string(from: lastDate) == formatter.string(from: yesterday) {
            newStreakValue += 1
            shouldIncrement = true
            print("Connecté hier → Streak +1 (\(newStreakValue))")
        } else {
            newStreakValue = 1
            shouldIncrement = true
            print("Première connexion ou oubli → Streak réinitialisée à 1")
        }

        // Sauvegarde la date du jour
        UserDefaults.standard.set(todayString, forKey: "lastConnectionDay")
        print("Date sauvegardée :", todayString)

        // Mise à jour côté serveur
        if shouldIncrement {
            do {
                let response = try await userRepo.patchStreak(streak: newStreakValue, token: token)
                currentUser.streakNumber = response.streakNumber
                self.currentUser = currentUser
                print("Streak mise à jour : \(response.streakNumber)")
            } catch {
                print("Erreur lors de la mise à jour de la streak: \(error)")
            }
        }
    }

    func uploadProfileImage(imageData: Data) async throws -> UserResponse {
        guard let token = token else {
            throw URLError(.userAuthenticationRequired)
        }
                
        do {
                // Appelle le backend qui retourne le user complet
            let updatedUser = try await APIService.shared.uploadImage(
                imageData: imageData,
                token: token
            )
            
                // Met à jour currentUser avec les nouvelles données
            self.currentUser = updatedUser
            
            return updatedUser
                        
        } catch {
            print("❌ Échec: \(error)")
            throw error
        }
    }
    
    // Initiales de l'utilisateur pour les livres
    var userInitials: String {
            guard let user = currentUser else { return "?" }
            
            let firstInitial = user.firstName.first.map { String($0).uppercased() } ?? ""
            let lastInitial = user.lastName.first.map { String($0).uppercased() } ?? ""
            
            return firstInitial + lastInitial
        }
}
