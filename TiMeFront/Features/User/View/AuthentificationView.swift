//
//  AuthentificationView.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct AuthentificationView: View {
    let title: Font = .system(size: 48).width(.expanded)
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack{
            Image("Background")
            VStack(alignment: .center, spacing:65){
                Text("Bienvenue")
                    .font(title.width(.expanded).weight(.black))
                    .foregroundStyle(.purpleText)
                    .overlay(alignment: .center) {
                        Image("Plant")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 73, height: 157)
                            .padding(.bottom, 80)
                            .padding(.leading, 48)
                    }
        
                Text("Incroyable bichette! Tu as fait un premier grand pas vers ta réussite !")
                    .font(.system(size: 14).width(.expanded).weight(.light))
                    .multilineTextAlignment(.center)
                    .lineSpacing(9)
                    .frame(width: 250)
                VStack(alignment: .leading, spacing: 20){
                    UserTextField(data: $email, label: "Email", size: (width: 280, heigth: 44))
                    VStack(alignment: .leading){
                        
                        HStack{
                            UserTextField(data: $password, label: "Mot de passe", size: (width: 230, heigth: 44))
                            
                            Button {
                                print("yes")
                            } label: {
                                Image(systemName: "arrow.forward")
                                    .foregroundStyle(.purpleDark)
                                    .padding(14)
                                
                            }
                            .background {
                                Circle()
                                    .fill(.white)
                                    .glassEffect()
                                
                            }
                            
                        }
                        Button {
                            print("j'ai oublier le mot de passe")
                        } label: {
                            Text("mot de passe oublié ?")
                                .font(.system(size: 8).width(.expanded))
                                .foregroundStyle(.purpleText)
                        }
                        .padding(.leading, 10)
                        
                    }
                }
                VStack{
                    Text("Pas encore de compte ? ")
                        .font(.system(size: 8).width(.expanded).weight(.light))
                        .foregroundStyle(.purpleText)
                    ButtonForm(title: "S'enregistrer", isImage: false)

                }
                
              
          
            }
            .padding()
            .padding(.top, 50)
               
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        AuthentificationView()
    } else {
        // Fallback on earlier versions
    }
}
