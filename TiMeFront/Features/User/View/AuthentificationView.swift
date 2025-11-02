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
    @State var navigateToUserForm: Bool = false
    @State var userVM = UserViewModel()
    @Environment(AuthViewModel.self) var authVM
    @State var views: [any View] = []
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                VStack(alignment: .center, spacing: 65) {
                    titleAuth
                    textMotivation
                    authForm
                    buttonAccessFormRegister
                }
                .frame(maxWidth: .infinity)
            }
            .onChange(of: authVM.isAuthenticated) { _, newValue in
                if newValue {
                    // Exemple : redirige vers une page principale
                    navigateToUserForm = false
                    //userVM.checkFormData
                    // Ou montre un autre écran principal
                }
            }
            .navigationDestination(isPresented: $navigateToUserForm) {
                UserFormView(userVM: userVM)
            }
            .navigationDestination(isPresented: $userVM.checkFormData) {
                UserRegisterView(userVM: userVM)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
    }
    
    
    var titleAuth: some View{
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
        .padding(.top, 100)
    }
    
    var textMotivation: some View{
        Text("Incroyable bichette! Tu as fait un premier grand pas vers ta réussite !")
            .font(.system(size: 14).width(.expanded).weight(.light))
            .foregroundStyle(.purpleText)
            .multilineTextAlignment(.center)
            .lineSpacing(9)
            .frame(width: 350)
    }
    
    var authForm: some View {
        VStack(spacing: 12) {
            
            HStack {
                UserTextField(
                    data: $userVM.usernameOrEmailAuth,
                    dataError: $userVM.userNameOrEmailAuthError,
                    label: "Email ou pseudo",
                    size: (width: 295, heigth: 44)
                )
            }
            
            HStack(alignment: .center, spacing: 12) {
                UserTextField(
                    data: $userVM.passwordAuth,
                    dataError: $userVM.passwordAuthError,
                    label: "Mot de passe",
                    size: (width: 233, heigth: 44)
                )
                
                buttonAuth
                    .frame(width: 50, height: 50)
            }
            
                forgetPassword
                .frame(width: 295, alignment: .leading)
                .padding(.leading, 30)
        }
    }
    
    var buttonAuth: some View{
        Button {
            userVM.validateLogin()
            
            if userVM.isloginValid {
                Task {
                    let input = userVM.usernameOrEmailAuth // Champ unique
                    let password = userVM.passwordAuth

                    if input.contains("@") {
                        await authVM.login(email: input, username: nil, password: password)
                    } else {
                        await authVM.login(email: nil, username: input, password: password)
                    }

                    print("✅ Connexion réussie")
                }
            } else {
                print("❌ Formulaire invalide")
            }
        } label: {
            Image(systemName: "arrow.forward")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.purpleDark)
                .padding()
        }
        .background {
            Circle()
                .fill(.white)
                .glassEffect()
        }
    }
    
    var forgetPassword: some View {
        Button {
            print("J'ai oublié mon mot de passe -> appelé")
        } label: {
            Text("mot de passe oublié ?")
                .font(.system(size: 8).width(.expanded))
                .foregroundStyle(.purpleText)
        }
    }
    
    var buttonAccessFormRegister: some View {
        VStack(spacing: 12){
            Text("Pas encore de compte ? ")
                .font(.system(size: 8).width(.expanded).weight(.light))
                .foregroundStyle(.purpleText)
            ButtonForm(title: "S'enregistrer", isImage: false) {
                navigateToUserForm.toggle()
            }
        }
        .padding(.top, 100)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        AuthentificationView(navigateToUserForm: false)
            .environment(AuthViewModel())
    }
}
