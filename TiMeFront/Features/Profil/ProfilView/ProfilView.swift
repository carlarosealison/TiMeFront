//
//  ProfilView.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.


import SwiftUI
import LocalAuthentication
import PhotosUI

struct ProfilView: View {
    @StateObject private var viewModel = ProfilViewModel()  // ← Utilise @StateObject
    @State private var isShowingPhotoPicker = false
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM

    
    enum EditField: Identifiable {
        case name, email, password
        var id: Self { self }
        
        var title: String {
            switch self {
            case .name: return "Modifier le nom"
            case .email: return "Modifier l'email"
            case .password: return "Modifier le mot de passe"
            }
        }
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            mainContent
            
            // Overlay centré pour l'édition
            if let field = viewModel.showingEdit {
                EditSheet(
                    field: field,
                    name: $viewModel.name,
                    email: $viewModel.email,
                    password: $viewModel.password,
                    onCancel: {
                        viewModel.showingEdit = nil
                    },
                    onSave: {
                        Task {
                            //  Appeler la fonction updateProfile du ProfilViewModel
                            let success = await viewModel.updateProfile(field: field)
                            
                            if success {
                                //  Synchroniser avec UserViewModel après succès
                                userVM.userName = viewModel.name
                                userVM.email = viewModel.email
                                if !viewModel.password.isEmpty {
                                    userVM.password = viewModel.password
                                }
                                print("✅ Profil mis à jour avec succès")
                            } else {
                                print("❌ Échec de la mise à jour")
                            }
                            
                            // Ferme la sheet
                            viewModel.showingEdit = nil
                        }
                    }
                )
                .transition(.scale.combined(with: .opacity))
                .zIndex(1)
            }
        }
        .onAppear {
            // Charger les données au démarrage
            viewModel.loadUserData(from: userVM)
        }
        .navigationDestination(isPresented: $viewModel.navigateToAuth) {
            if #available(iOS 26.0, *) {
                AuthentificationView()
            } else {
                // Fallback on earlier versions
            }
        }
        .onChange(of: viewModel.faceIDOn) { _, newValue in
            if newValue { viewModel.authenticateFaceID() }
        }
        .alert("Êtes-vous sûr de vouloir vous déconnecter ?", isPresented: $viewModel.showLogoutConfirm) {
            Button("Annuler", role: .cancel) {}
            Button("Valider", role: .destructive) {
                authVM.logout()
                viewModel.navigateToAuth = true
            }
        }
        .photosPicker(isPresented: $isShowingPhotoPicker, selection: $viewModel.selectedPhotoItem)
        .onChange(of: viewModel.selectedPhotoItem) { _, newValue in
            viewModel.loadProfileImage(from: newValue)
        }
    }
}

// MARK: - Sous-vues pour alléger le body

private extension ProfilView {
    
    var mainContent: some View {
        VStack(spacing: 35) {
            Spacer()
            
            avatarSection
            Text(userVM.userName.isEmpty ? "Invité" : userVM.userName)
                .font(.title2)
                .bold()
                .foregroundColor(Color("PurpleText"))

            
            optionsSection
            logoutButton
            
            Spacer()
        }
    }
    
    var avatarSection: some View {
        ZStack(alignment: .bottomTrailing) {
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 100, height: 100)
                .overlay(
                    Group {
                        if let image = viewModel.profilImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 70))
                                .foregroundColor(Color("PurpleText"))
                        }
                    }
                    .clipShape(Circle())
                )
            
            Button(action: { isShowingPhotoPicker = true }) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .overlay(Image(systemName: "pencil").foregroundColor(.black))
                    .shadow(radius: 2)
            }
        }
    }
    
    var optionsSection: some View {
        VStack(spacing: 0) {
            Button { viewModel.showingEdit = .name } label: {
                ProfilRow(icon: "pencil", text: "Modifier le nom")
            }
            Divider().frame(minHeight: 1)
            
            Button { viewModel.showingEdit = .email } label: {
                ProfilRow(icon: "envelope.fill", text: "Modifier l'email")
            }
            Divider().frame(minHeight: 1)
            
            Button { viewModel.showingEdit = .password } label: {
                ProfilRow(icon: "lock.fill", text: "Modifier le mot de passe")
            }
            Divider().frame(minHeight: 1)
            
            ToggleRow(icon: "bell.fill", text: "Notifications", isOn: $viewModel.notificationsOn)
            Divider().frame(minHeight: 1)
            
            ToggleRow(icon: "faceid", text: "Utiliser Face ID", isOn: $viewModel.faceIDOn)
        }
        .tint(Color("PurpleButton"))
        .glassEffectIfAvailable(cornerRadius: 29)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 24)
    }
    
    var logoutButton: some View {
        Button("Déconnexion") {
            viewModel.showLogoutConfirm = true
        }
        .font(Font.custom("SF Pro", size: 19))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Capsule().fill(Color("RedCustom")))
        .padding(.horizontal, 70)
        .padding(.bottom, 24)
    }
}

#Preview {
    ProfilView()
        .environment(AuthViewModel())
        .environment(UserViewModel())
}

