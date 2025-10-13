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
    var isLogin: Bool = false
    
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
    
    func uploadImageToVapor() async -> String? {
        guard let imageData = selectedImageData else {
            print("Aucune image à uploader")
            return nil
        }
        
        let url = URL(string: "http://127.0.0.1:8080/users/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        let filename = "profile.jpg"
        let mimetype = "image/jpeg"
        
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Upload échoué, statut non 200")
                return nil
            }
            
            struct UploadResponse: Decodable { let imageURL: String }
            let decoded = try JSONDecoder().decode(UploadResponse.self, from: data)
            self.imageProfil = decoded.imageURL
            print("Image uploadée : \(decoded.imageURL)")
            return decoded.imageURL
        } catch {
            print("Erreur upload : \(error)")
            return nil
        }
    }
    
}
