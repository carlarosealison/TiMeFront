//
//  UserViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import SwiftUI
import PhotosUI
import FirebaseStorage

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
    
    let userRepo = UserRepo()
    
    func createUser(firstName: String, lastName: String, userName: String, email: String, password: String, imageProfil: String?)async throws{
        do{
            let newUser = try await userRepo.creatUser(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password, imageProfil: imageProfil ?? "")
            if newUser.statusCode == 200{
                do{
                    try await resetForm()
                }catch{
                    print("erreur de la mise à jour du formulaire \(error)")
                }
            }
        }catch{
            print("erreur de saisie \(error)")
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
    
    func uploadImageFireBase() async -> String? {
        guard let imageData = selectedImageData else {
            print("⚠️ Aucune image sélectionnée")
            return nil
        }

        isUploading = true
        errorMessage = nil

        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("profilePics/\(UUID().uuidString).jpg")

        do {
            //Upload explicite avec métadonnées
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"

            //Attente réelle de la fin de l’upload
            let _ = try await imageRef.putDataAsync(imageData, metadata: metadata)

            // 3️⃣ Attendre un petit délai pour la propagation côté Storage (rare mais utile en dev local)
            try await Task.sleep(nanoseconds: 300_000_000) // 0.3s

            //Récupération de l’URL publique
            let url = try await imageRef.downloadURL()
            let urlString = url.absoluteString
            imageProfil = urlString

            print("✅ Upload réussi : \(urlString)")
            isUploading = false
            return urlString

        } catch {
            errorMessage = error.localizedDescription
            print("❌ Erreur Firebase : \(error.localizedDescription)")
            isUploading = false
            return nil
        }
    }
}
