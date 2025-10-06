//
//  UserRegisterView.swift
//  TiMeFront
//
//  Created by apprenant152 on 30/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct UserRegisterView: View {
    var body: some View {
        ZStack{
            Image("Background")
            VStack(spacing: 100){
                TitleForm(title: "Photo de profil", isWelcome: false)
                addProfilPicture
                ButtonForm(title: "Enregistrer", isImage: true)
                  .padding(.top, 100)
            }
            .padding()
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
        UserRegisterView()
    } else {
        // Fallback on earlier versions
    }
}
