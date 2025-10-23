//
//  ProfilViewModel.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.
//

//
// ProfilViewModel.swift
// TiMeFront
//
// Created by Mounir on 26/09/2025.
//

import SwiftUI
import LocalAuthentication
import PhotosUI

final class ProfilViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var profilImage: UIImage?
    
    @Published var notificationsOn: Bool = true
    @Published var faceIDOn: Bool = false
    @Published var showLogoutConfirm: Bool = false
    @Published var navigateToAuth: Bool = false
    
    @Published var showingEdit: ProfilView.EditField?
    @Published var selectedPhotoItem: PhotosPickerItem?
    
    @MainActor
    func loadUserData(from userVM: UserViewModel) {
        self.name = userVM.userName
        self.email = userVM.email
        self.password = ""
    }
    
    // MARK: - Chargement image
    func loadProfileImage(from item: PhotosPickerItem?) {
        guard let item = item else { return }
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage( data: data) {
                await MainActor.run { self.profilImage = uiImage }
            }
        }
    }
    
    // MARK: - Authentification Face ID
    func authenticateFaceID() {
        let context = LAContext()
        context.localizedCancelTitle = "Annuler"
        
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Nous avons besoin de confirmer votre identité."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evalError in
                DispatchQueue.main.async {
                    if !success {
                        self.faceIDOn = false
                    }
                }
            }
        } else {
            faceIDOn = false
        }
    }
    
    @MainActor
    func updateProfile(field: ProfilView.EditField) async -> Bool {
        print("🔵 === DÉBUT updateProfile ===")
        print("🔵 Field: \(field)")
        print("🔵 Name: \(name)")
        print("🔵 Email: \(email)")
        
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            print("❌ Pas de token JWT")
            return false
        }
        
        print("✅ Token trouvé: \(token.prefix(30))...")
        
        guard let url = URL(string: "http://127.0.0.1:8080/users/update") else {
            print("❌ URL invalide")
            return false
        }
        
        print("✅ URL: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let payload: [String: String] = {
            switch field {
            case .name:
                return ["userName": name]
            case .email:
                return ["email": email]
            case .password:
                return ["password": password]
            }
        }()
        
        print("📤 Payload: \(payload)")
        
        if let body = try? JSONSerialization.data(withJSONObject: payload, options: []) {
            request.httpBody = body
        } else {
            print("❌ Impossible d'encoder le payload en JSON")
        }
        
        do {
            print("🔵 Envoi de la requête...")
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("📡 Code HTTP: \(httpResponse.statusCode)")
                
                // ✅ CORRECTION ICI - Enlevé l'espace
                if let responseText = String(data: data, encoding: .utf8) {
                    print("Réponse: \(responseText)")
                }
                
                if httpResponse.statusCode == 200 {
                    print("✅ Succès!")
                    return true
                } else {
                    print("❌ Échec - Code: \(httpResponse.statusCode)")
                    return false
                }
            }
            
            print("❌ Pas de réponse HTTP")
            return false
            
        } catch {
            print("❌ Erreur réseau: \(error.localizedDescription)")
            return false
        }
    }
}

//@MainActor
//func updateProfile(field: EditField) async -> Bool {
//    guard let url = URL(string: "https://ton-backend.com/api/updateProfile") else { return false }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    // Crée le dictionnaire selon le champ modifié
//    var body: [String: Any] = [:]
//    switch field {
//    case .name: body["name"] = name
//    case .email: body["email"] = email
//    case .password: body["password"] = password
//    }
//
//    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
//
//    do {
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            print("Erreur serveur")
//            return false
//        }
//
//        // Tu peux parser `data` si ton API renvoie un JSON
//        return true
//    } catch {
//        print("Erreur réseau:", error)
//        return false
//    }
//}

