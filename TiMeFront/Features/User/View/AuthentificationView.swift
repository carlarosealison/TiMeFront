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
    @State var isNext: Bool = false
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
            }
            .onChange(of: authVM.isAuthenticated) { _, newValue in
                if newValue {
                    // Exemple : redirige vers une page principale
                    navigateToUserForm = false
                    isNext = false
                    // Ou montre un autre écran principal
                    print("Utilisateur connecté ! Redirection...")
                }
            }
            .navigationDestination(isPresented: $navigateToUserForm) {
                UserFormView(isNext: $isNext, userVM: userVM)
            }
            .navigationDestination(isPresented: $isNext) {
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
            .padding(.top, 30)
    }
    
    var textMotivation: some View{
        Text("Incroyable bichette! Tu as fait un premier grand pas vers ta réussite !")
            .font(.system(size: 14).width(.expanded).weight(.light))
            .multilineTextAlignment(.center)
            .lineSpacing(9)
            .frame(width: 250)
    }
    
    var authForm: some View{
        VStack(alignment: .leading, spacing: 30){
            UserTextField(data: $userVM.email, label: "Email", size: (width: 280, heigth: 44))
            VStack(alignment: .leading){
                HStack{
                    UserTextField(data: $userVM.password, label: "Mot de passe", size: (width: 230, heigth: 44))
                    buttonAuth
                }
                forgetPassword
            }
        }
    }
    
    var buttonAuth: some View{
        Button {
            Task {
                await authVM.login(email: userVM.email, password: userVM.password)
                print("🔑 Tentative de connexion terminée")
            }
            
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
    
    var forgetPassword: some View{
        Button {
            print("j'ai oublier le mot de passe")
        } label: {
            Text("mot de passe oublié ?")
                .font(.system(size: 8).width(.expanded))
                .foregroundStyle(.purpleText)
        }
        .padding(.leading, 10)
    }
    
    var buttonAccessFormRegister: some View{
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
    } else {
        // Fallback on earlier versions
    }
}
