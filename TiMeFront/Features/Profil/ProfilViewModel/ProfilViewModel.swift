//
//  ProfilViewModel.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.
//

import SwiftUI
import LocalAuthentication
import PhotosUI

final class ProfilViewModel: ObservableObject {
    @Published var name: String = "Carla"
    @Published var email: String = "exemple@mail.com"
    @Published var password: String = "********"
    @Published var profilImage: UIImage?
    
    @Published var notificationsOn: Bool = true
    @Published var faceIDOn: Bool = false
    @Published var showLogoutConfirm: Bool = false
    @Published var navigateToAuth: Bool = false
    
    @Published var showingEdit: ProfilView.EditField?
    @Published var selectedPhotoItem: PhotosPickerItem?
    
    // MARK: - Chargement image
    func loadProfileImage(from item: PhotosPickerItem?) {
        guard let item = item else { return }
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
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
