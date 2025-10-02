//
//  UserFormView.swift
//  TiMeFront
//
//  Created by apprenant152 on 30/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct UserFormView: View {
    @Binding var isNext: Bool
    @Bindable var userVM : UserViewModel
    
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 80){
                TitleForm(title: "Inscription", isWelcome: false)
                
                userFormTextField
                
                ButtonForm(title: "Suivant", isImage: true, action: {
                    print(userVM.email)
                    print(userVM.firstName)
                    isNext.toggle()
                })
                .padding(.top, 100)
            }
        }
    }
    
    var userFormTextField: some View{
        VStack(spacing: 30){
            HStack{
                UserTextField(data: $userVM.firstName, label: "Prénom", size: (width: 135, heigth: 44))
                UserTextField(data: $userVM.lastName, label: "Nom", size: (width: 135, heigth: 44))
            }
            UserTextField(data: $userVM.userName, label: "Surnom", size: (width: 280, heigth: 44))
            
            UserTextField(data: $userVM.email, label: "Email", size: (width: 280, heigth: 44))
            UserTextField(data: $userVM.password, label: "Mot de passe", size: (width: 280, heigth: 44))
            UserTextField(data: $userVM.confirmPassword, label: "Confirmer mot de passe", size: (width: 280, heigth: 44))
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserFormView(isNext: .constant(false), userVM: .init())
    } else {
        // Fallback on earlier versions
    }
}
