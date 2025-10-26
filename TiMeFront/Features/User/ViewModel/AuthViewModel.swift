//
//  AuthViewModel.swift
//  TiMeFront
//
//  Created by apprenant152 on 13/10/2025.
//

import SwiftUI

@MainActor
@Observable
class AuthViewModel {
    var isAuthenticated = false
    var token: String?
    var currentUser: UserResponse?

    private let userRepo = UserRepo()

    // MARK: - Login utilisateur
    func login(email: String?, username: String?, password: String) async {
        do {
            let token = try await userRepo.login(email: email, username: username, password: password)
            self.token = token
            self.isAuthenticated = true
            // ✅ AJOUTE CES 2 LIGNES
            UserDefaults.standard.set(token, forKey: "jwtToken")
            print("💾 Token sauvegardé dans UserDefaults")
            print("✅ Connecté avec token: \(token)")
            await fetchUserProfile()
        } catch {
            print("❌ Erreur lors du login: \(error)")
            self.isAuthenticated = false
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
            let url = URL(string: "http://127.0.0.1:8080/users/profile")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("❌ Erreur profil: statut HTTP invalide")
                return
            }

            let user = try JSONDecoder().decode(UserResponse.self, from: data)
            self.currentUser = user
            print("👤 Profil récupéré: \(user.userName)")
        } catch {
            print("❌ Erreur récupération profil: \(error)")
        }
    }
}
