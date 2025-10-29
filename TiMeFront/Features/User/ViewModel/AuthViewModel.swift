//
//  AuthViewModel.swift
//  TiMeFront
//
//  Created by apprenant152 on 13/10/2025.
//

import SwiftUI

//@MainActor
@Observable
class AuthViewModel {
    var isAuthenticated = false
    var token: String?
    var currentUser: UserResponse?

    private let userRepo = UserRepo() // supposé utiliser APIService.shared
    private let baseURL = APIService.shared.baseURL
    
    // MARK: - Login utilisateur
//    func login(email: String?, username: String?, password: String) async {
//        do {
//            let token = try await userRepo.login(email: email, username: username, password: password)
//            self.token = token
//            self.isAuthenticated = true
//            print("✅ Connecté avec token: \(token)")
//            await fetchUserProfile()
//        } catch {
//            print("❌ Erreur lors du login: \(error)")
//            self.isAuthenticated = false
//        }
//    }
    
    func login(email: String?, username: String?, password: String) async {
        do {
            let token = try await userRepo.login(email: email, username: username, password: password)
            self.token = token
            self.isAuthenticated = true
            
            // ✅ Sauvegarde du token dans UserDefaults
            UserDefaults.standard.set(token, forKey: "token")
            print("✅ Connecté avec token: \(token)")
            
            // Décoder le JWT pour extraire l'userId
            if let userId = extractUserIdFromJWT(token) {
                UserDefaults.standard.set(userId, forKey: "userId")
                print("💾 UserId extrait du JWT et sauvegardé : \(userId)")
            } else {
                print("⚠️ Impossible d'extraire l'userId du token")
            }
            
            await fetchUserProfile()
        } catch {
            print("❌ Erreur lors du login: \(error)")
            self.isAuthenticated = false
        }
    }



    
    // MARK: - Helper : Décoder JWT
    private func extractUserIdFromJWT(_ token: String) -> String? {
        // Un JWT est composé de 3 parties séparées par des points : header.payload.signature
        let parts = token.split(separator: ".")
        guard parts.count == 3 else {
            print("⚠️ Token JWT invalide (pas 3 parties)")
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
            print("⚠️ Impossible de décoder le payload JWT en Base64")
            return nil
        }
        
        // Parse le JSON
        do {
            if let json = try JSONSerialization.jsonObject(with: decodedData) as? [String: Any],
               let userId = json["id"] as? String {
                return userId
            } else {
                print("⚠️ Payload JWT ne contient pas 'id' : \(String(data: decodedData, encoding: .utf8) ?? "non décodable")")
                return nil
            }
        } catch {
            print("⚠️ Erreur parsing JSON du JWT : \(error)")
            return nil
        }
    }
    
    // MARK: - Déconnexion
    func logout() {
        token = nil
        currentUser = nil
        isAuthenticated = false

        UserDefaults.standard.removeObject(forKey: "jwtToken")
        print(" Déconnexion réussie")
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
                print("❌ Erreur profil: statut HTTP invalide")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📥 JSON profil reçu : \(jsonString)")
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let user = try decoder.decode(UserResponse.self, from: data)
            
            self.currentUser = user
            
            
            print("👤 Profil récupéré: \(user.userName)")
            
        } catch {
            print("❌ Erreur récupération profil: \(error)")
        }
    }
    }

