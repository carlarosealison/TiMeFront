//
//  UserFormView.swift
//  TiMeFront
//
//  Created by apprenant152 on 30/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct UserFormView: View {
    
    @Bindable var userVM : UserViewModel
    
    @State var formBoard: [any View] = []
    
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 80){
                TitleForm(title: "Inscription", isWelcome: false)
               
                userFormTextField
               
                ButtonForm(title: "Suivant", isImage: true, action: {
                    userVM.validateForm()
                        if userVM.isFormValid {
                            print("Formulaire valide ✅")
                            userVM.checkFormData = true
                        } else {
                            print("Formulaire invalide ❌")
                        }
                })
                .padding(.top, 100)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    var userFormTextField: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                
                UserTextField(data: $userVM.firstName, dataError: $userVM.firstNameError, label: "Prénom", size: (width: 135, heigth: 44))
                
                
                
                UserTextField(data: $userVM.lastName, dataError: $userVM.lastNameError, label: "Nom", size: (width: 135, heigth: 44))
                
            }
            
            
            UserTextField(data: $userVM.userName, dataError: $userVM.userNameError, label: "Surnom", size: (width: 280, heigth: 44))
            
            
            
            
            UserTextField(data: $userVM.email, dataError: $userVM.emailError, label: "Email", size: (width: 280, heigth: 44))
            
            
            
            
            UserTextField(data: $userVM.password, dataError: $userVM.passwordError, label: "Mot de passe", size: (width: 280, heigth: 44))
            
            
            
            
            UserTextField(data: $userVM.confirmPassword, dataError: $userVM.confirmPasswordError, label: "Confirmer mot de passe", size: (width: 280, heigth: 44))
            
        }
    }
    
    
    var addProfilPicture: some View{
        VStack{
            Button {
                print("add photo")
            } label: {
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
            
            Text("Ajouter une photo de profil")
                .font(.system(size: 12).width(.expanded).bold())
                .foregroundStyle(.purpleDark)
                .padding()
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserFormView(userVM: .init())
    } else {
        // Fallback on earlier versions
    }
}
