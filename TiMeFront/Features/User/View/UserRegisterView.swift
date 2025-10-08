//
//  UserRegisterView.swift
//  TiMeFront
//
//  Created by apprenant152 on 30/09/2025.
//

import SwiftUI
import PhotosUI

@available(iOS 26.0, *)
struct UserRegisterView: View {
    @Bindable var userVM : UserViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 100){
                TitleForm(title: "Photo de profil", isWelcome: false)
                addProfilPicture
                ButtonForm(title: "Enregistrer", isImage: false, action: {
                    Task{
                        if let userImageProfil = await userVM.uploadImageFireBase(){
                            do{
                                try await userVM.createUser(firstName: userVM.firstName, lastName: userVM.lastName, userName: userVM.userName, email: userVM.email, password: userVM.password, imageProfil: userImageProfil)
                                dismiss()
                            }catch{
                                print("Error \(error)")
                            }
                        }
                    }
                   
                })
                .padding(.top, 100)
            }
            .padding()
        }
        
    }
    
    var addProfilPicture: some View{
        VStack{
            if let image = userVM.image{
                image
                    .resizable()
                    .scaledToFill()
                    .glassEffect()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            }else{
                PhotosPicker(selection: $userVM.selectedImage, matching: .images) {
                    CirclePicker
                }
            }
            
            Text("Ajouter une photo de profil")
                .font(.system(size: 12).width(.expanded).bold())
                .foregroundStyle(.purpleDark)
                .padding()
        }
        .onChange(of: userVM.selectedImage){
            Task{
                do{
                    if let data = try await userVM.selectedImage? .loadTransferable(type: Data.self),
                       let uIImage = UIImage(data: data){
                        userVM.image = Image(uiImage: uIImage)
                        userVM.selectedImageData = data
                    }
                    print("Image importer")
                }catch{
                    print("Image introuvable")
                }
            }
        }
    }
    
    var CirclePicker : some View{
        Circle()
            .fill(.white)
            .glassEffect()
            .frame(width: 200, height: 200)
            .overlay{
                Image(systemName: "person.badge.plus")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(.purpleText)
                    .frame(width: 122, height: 115)
                    .padding(.leading, 32)
            }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserRegisterView(userVM: .init())
    } else {
        // Fallback on earlier versions
    }
}
