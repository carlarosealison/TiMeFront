//
//  UserViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import SwiftUI
import PhotosUI

@MainActor
@Observable
class UserViewModel{
    
    var firstName: String = ""
    var lastName: String = ""
    var userName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var imageProfil: String?
    var selectedImage: PhotosPickerItem?
    var image : Image?
    var selectedImageData: Data? = nil
    private var isUploading: Bool = false
    private var errorMessage: String?
    private var downloadURL: String = ""
    private var uploadProgress: Double = 0
    
    var usernameOrEmailAuth: String = ""
    
    var passwordAuth: String = ""
    
    var isLogin: Bool = false
    var checkFormData: Bool = false
    
    let userRepo = UserRepo()
    let apiService = APIService()
    //On check si la password est identique au confirmPassword
    func checkFormUser(){
        let userFormData = [firstName, lastName, userName, email, password, confirmPassword]
        
        if userFormData.allSatisfy({!$0.isEmpty}) && password == confirmPassword{
            checkFormData = true
        }else{
            print("Champ non renseigné ou le mot de passe n'est pas identique au à la confirmation")
        }
    }
    
    var firstNameError: String?
    var lastNameError: String?
    var userNameError: String?
    var userNameOrEmailAuthError: String?
    var emailError: String?
    var passwordError: String?
    var passwordAuthError: String?
    var confirmPasswordError: String?
    
    var isFormValid: Bool {
        // Vérifie que tous les champs sont non vides et cohérents
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !userName.isEmpty &&
        isValidEmail(email) &&
        !password.isEmpty &&
        password == confirmPassword
    }
    
    var isloginValid: Bool {
        // Vérifie que tous les champs sont non vides et cohérents
        !usernameOrEmailAuth.isEmpty && !passwordAuth.isEmpty
    }
    enum Form{
        case login
        case register
    }
    
    
    func validateForm() {
        firstNameError = firstName.isEmpty ? "Le prénom est requis" : nil
        lastNameError = lastName.isEmpty ? "Le nom est requis" : nil
        userNameError = userName.isEmpty ? "Le surnom est requis" : nil
        emailError = isValidEmail(email) ? nil : "Email invalide"
        passwordError = password.isEmpty ? "Mot de passe requis" : nil
        confirmPasswordError = (confirmPassword != password) ? "Les mots de passe ne correspondent pas" : nil
    }
    
    func validateLogin() {
        userNameOrEmailAuthError = userName.isEmpty ? "Le surnom ou l'email est requis" : nil
        passwordAuthError = password.isEmpty ? "Mot de passe requis" : nil
    }
    
    
    func isCheckDataValid(form: Form) -> Bool{
        if form == .login{
            return isloginValid
        }else if form == .register{
            return  isFormValid
        }
        return false
    }
    
    // Vérification simple de l'email
    private func isValidEmail(_ email: String) -> Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
    
    func createUserAndLogin(authVM: AuthViewModel) async {
        do {
            // Création utilisateur
            let newUser = try await userRepo.creatUser(
                firstName: firstName,
                lastName: lastName,
                userName: userName,
                email: email,
                password: password,
                imageProfil: imageProfil ?? ""
            )
            
            print("✅ Utilisateur créé : \(newUser.userName)")
            
            //Auto-login avec les infos saisies
            await authVM.login(
                email: email.isEmpty ? nil : email,
                username: email.isEmpty ? userName : nil,
                password: password
            )
            
            // Reset du formulaire
            try await resetForm()
            
        } catch {
            print("❌ Erreur lors de la création ou connexion : \(error)")
        }
    }
    
    func resetForm() async throws{
        firstName = ""
        lastName = ""
        userName = ""
        email = ""
        password = ""
        confirmPassword = ""
        imageProfil = ""
    }
    
    
    
    func uploadImageToVapor() async -> String? {
        guard let imageData = selectedImageData else {
            print("Aucune image à uploader")
            return nil
        }
        
        do {
            // Utilise APIService qui gère automatiquement l'IP
            let imageURL = try await apiService.uploadImage(imageData: imageData)
            self.imageProfil = imageURL
            print("Image uploadée : (imageURL)")
            return imageURL
        } catch {
            print("Erreur upload : (error)")
            return nil
        }
    }
}



