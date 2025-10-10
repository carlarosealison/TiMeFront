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
    
    @State var formBoard: [any View] = []
    
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 80){
                TitleForm(title: "Inscription", isWelcome: false)
               
                userFormTextField
               
                ButtonForm(title: "Suivant", isImage: true, action: {
                    if userVM.password == userVM.confirmPassword{
                        isNext.toggle()
                    }else{
                        userVM.confirmPassword = ""
                    }
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
        UserFormView(isNext: .constant(false), userVM: .init())
    } else {
        // Fallback on earlier versions
    }
}
