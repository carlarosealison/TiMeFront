//
//  ProfilViewModel.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.
//

import SwiftUI
import LocalAuthentication
import PhotosUI

@Observable
final class ProfilViewModel {
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var profilImage: UIImage?
    
    var notificationsOn: Bool = true
    var faceIDOn: Bool = false
    var showLogoutConfirm: Bool = false
    var navigateToAuth: Bool = false
    
    var showingEdit: ProfilView.EditField?
    var selectedPhotoItem: PhotosPickerItem?
    
    var isUploadingImage: Bool = false
    var uploadError: String?
    
    private let userRepo = UserRepo()
    
    @MainActor
    func loadUserData(from authVM: AuthViewModel) {
        guard let user = authVM.currentUser else {
            print("⚠️ Pas d'utilisateur connecté")
            return
        }
        
        self.name = user.userName
        self.email = user.email
        self.password = ""
    }
    
        // MARK: Charge et upload automatiquement la photo de profil
    func loadAndUploadProfileImage(from item: PhotosPickerItem?, authVM: AuthViewModel) {
        guard let item = item else { return }
        
        Task {
            await MainActor.run { isUploadingImage = true }
            defer { Task { await MainActor.run { isUploadingImage = false } } }
            
            do {
                    // Charge l'image depuis PhotosPicker
                guard let data = try await item.loadTransferable(type: Data.self) else {
                    await MainActor.run {
                        uploadError = "Impossible de charger l'image"
                    }
                    return
                }
                
                    // Crée l'UIImage pour l'afficher localement
                if let uiImage = UIImage(data: data) {
                    await MainActor.run {
                        self.profilImage = uiImage
                    }
                }
                
                    // Upload vers le backend via AuthViewModel
                let updatedUser = try await authVM.uploadProfileImage(imageData: data)
                
                await MainActor.run {
                    print("✅ Photo de profil mise à jour")
                }
                
            } catch {
                await MainActor.run {
                    print("❌ Erreur upload : \(error)")
                    uploadError = "Impossible d'uploader l'image"
                        // Réinitialise l'image locale en cas d'échec
                    self.profilImage = nil
                }
            }
        }
    }
    
    // MARK: Met à jour les infos du profil (nom, email, mot de passe)
    @MainActor
    func updateProfile(field: ProfilView.EditField, authVM: AuthViewModel) async -> Bool {
        guard authVM.token != nil else {
            print("❌ Pas de token disponible")
            return false
        }
        
        do {
            let updatedUser = try await userRepo.updateUser(
                firstName: authVM.currentUser?.firstName ?? "",  // Garde l'existant
                lastName: authVM.currentUser?.lastName ?? "",     // Garde l'existant
                userName: name,                                   // Nouveau
                email: email,                                     // Nouveau
                password: password.isEmpty ? "" : password,       // Nouveau si non vide
                imageProfil: authVM.currentUser?.imageProfil      // Garde l'existant
            )
            
                // Met à jour AuthViewModel
            authVM.currentUser = updatedUser
            
                // Réinitialise le champ password pour la sécurité
            if case .password = field {
                self.password = ""
            }
            
            print("✅ Profil mis à jour")
            return true
            
        } catch {
            print("❌ Erreur mise à jour : \(error)")
            uploadError = "Impossible de mettre à jour le profil"
            return false
        }
    }
    
        // MARK: Authentification Face ID
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
