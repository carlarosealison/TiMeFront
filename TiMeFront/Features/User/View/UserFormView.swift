//
//  UserFormView.swift
//  TiMeFront
//
//  Created by apprenant152 on 30/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct UserFormView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State var userVM = UserViewModel()
    
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 80){
                TitleForm(title: "Inscription", isWelcome: false)
                    
                userFormTextField

                ButtonForm(title: "Suivant", isImage: true, action: {
                    Task{
                        do{
                            try await userVM.createUser(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password, confirmPassword: confirmPassword)
                        }catch{
                            print("Error \(error)")
                        }
                    }
                })
                    .padding(.top, 100)

            }
        }

    }
    
    
    
    var userFormTextField: some View{
        VStack(spacing: 30){
            HStack{
                UserTextField(data: $firstName, label: "Prénom", size: (width: 135, heigth: 44))
                UserTextField(data: $lastName, label: "Nom", size: (width: 135, heigth: 44))
            }
            UserTextField(data: $userName, label: "Surnom", size: (width: 280, heigth: 44))
            
            UserTextField(data: $email, label: "Email", size: (width: 280, heigth: 44))
            UserTextField(data: $password, label: "Mot de passe", size: (width: 280, heigth: 44))
            UserTextField(data: $confirmPassword, label: "Comfirmer mot de passe", size: (width: 280, heigth: 44))
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserFormView()
    } else {
        // Fallback on earlier versions
    }
}
