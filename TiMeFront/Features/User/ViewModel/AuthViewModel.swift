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
    
    private let userRepo = UserRepo()
    private let baseURL = APIService.shared.baseURL
    
    // MARK: - Login utilisateur
    func login(email: String?, username: String?, password: String) async {
        do {
            let token = try await userRepo.login(email: email, username: username, password: password)
            self.token = token
            self.isAuthenticated = true
            UserDefaults.standard.set(token, forKey: "jwtToken")
            
            // Décoder le JWT pour extraire l'userId
            if let userId = extractUserIdFromJWT(token) {
                UserDefaults.standard.set(userId, forKey: "userId")
            } else {
                print("Impossible d'extraire l'userId du token")
            }
            
            await fetchUserProfile()
            
            await incrementStreakIfNeeded()
            
        } catch {
            print("Erreur lors du login: \(error)")
            self.isAuthenticated = false
        }
    }
    
    // MARK: - Helper : Décoder JWT
    private func extractUserIdFromJWT(_ token: String) -> String? {
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
<<<<<<< HEAD
            
            print("👤 Profil récupéré: \(user.userName)")
            
=======
                        
>>>>>>> main
        } catch {
            print("Erreur récupération profil: \(error)")
        }
    }
    
        // MARK: Fonction pour gérer la streak
    func incrementStreakIfNeeded() async {
        guard let token else { return }
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
            // Récupère la dernière date de connexion (peu importe si elle a incrémenté ou non)
        let lastConnectionDate = UserDefaults.standard.object(forKey: "lastConnectionDate") as? Date
                
            // Cas 1 : Déjà connecté aujourd'hui → Ne rien faire
        if let lastDate = lastConnectionDate,
           calendar.isDate(lastDate, inSameDayAs: today) {
            return
        }
        
            // Cas 2 : Vérifier si je me suis connecté hier
        var shouldIncrement = false
        
        if let lastDate = lastConnectionDate {
                // Calcule hier
            if let yesterday = calendar.date(byAdding: .day, value: -1, to: today),
               calendar.isDate(lastDate, inSameDayAs: yesterday) {
                    // Je me suis connecté hier → +1
                shouldIncrement = true
                print("Connecté hier → Streak +1")
            } else {
                    // Je ne me suis pas connecté hier → Streak garde sa valeur
                shouldIncrement = false
                print("Pas connecté hier → Streak garde sa valeur")
            }
        } else {
                // Première connexion → On démarre à 1
            shouldIncrement = true
            print("Première connexion → Streak = 1")
        }
        
            // Toujours sauvegarder la date d'aujourd'hui
        UserDefaults.standard.set(today, forKey: "lastConnectionDate")
        print("Date de connexion sauvegardée : \(today)")
        
            // Incrémenter uniquement si consécutif
        if shouldIncrement {
            do {
                let apiService = APIService()
                var request = URLRequest(url: apiService.baseURL.appendingPathComponent("users/streak/increment"))
                request.httpMethod = "POST"
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
                let (data, response) = try await URLSession.shared.data(for: request)
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    print("Erreur incrémentation streak")
                    return
                }
                
                let decoder = JSONDecoder()
                let updatedUser = try decoder.decode(UserResponse.self, from: data)
                self.currentUser = updatedUser
                
            } catch {
                print("Erreur gestion streak: \(error)")
            }
        } else {
                // Ne fait rien, la streak garde sa valeur
        }
    }
    }

