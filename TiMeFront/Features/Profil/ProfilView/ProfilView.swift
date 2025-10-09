//
//  ProfilView.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.
//

import SwiftUI
import LocalAuthentication
import PhotosUI

extension View {
    @ViewBuilder
    func glassEffectIfAvailable(cornerRadius: CGFloat = 15) -> some View {
//         Utiliser l'effet Liquid Glass
        if #available(iOS 26.0, *) {
            self.glassEffect(.regular.tint(.white.opacity(0.2)), in: .rect(cornerRadius: cornerRadius))
        } else {
            self.background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white.opacity(0.6))
            )
        }
    }
}

// Demande une authentification biométrique

func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
    let context = LAContext()
    // Définit le libellé du bouton Annuler (localisé en français)
    context.localizedCancelTitle = "Annuler"
    var error: NSError?
    
    // Vérifie si l'appareil prend en charge l'authentification biométrique
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Nous avons besoin de confirmer votre identité."
        // Demande l'authentification biométrique à l'utilisateur et appelle la complétion avec succès ou erreur
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evalError in
            DispatchQueue.main.async {
                completion(success, evalError)
            }
        }
    } else {
        // Biométrie indisponible : appeler immédiatement la complétion avec un échec et l'erreur
        DispatchQueue.main.async {
            completion(false, error)
        }
    }
}

struct ProfileView: View {
    @State private var notificationsOn = false
    @State private var faceIDOn = false
    @State private var showPhotoPicker = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: UIImage? = nil
    @State private var navigateToAuth: Bool = false
    
    enum EditField: Identifiable {
        case name, password, email;
        
        var id: Int {
            switch self {
            case .name: return 0;
            case .password: return 1;
            case .email: return 2
            }
        };
        var title: String {
            switch self {
            case .name: return "Modifier le nom";
            case .password: return "Modifier le mot de passe";
            case .email: return "Modifier l'email"
            }
        }
    }
    @State private var showingEdit: EditField? = nil
    @State private var tempName: String = "Carla Paul"
    @State private var tempEmail: String = "carla@example.com"
    @State private var tempPassword: String = ""
    @State private var showLogoutConfirm: Bool = false
    
    var body: some View {
                    ZStack{
               
                // Image de fond
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 35) {
                        
                        /*
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color("PurpleText"))
                                    .padding()
                                    .background(Circle()
                                        .fill(Color.white))
                                    .shadow(radius: 2)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        */
                        
                        // Avatar
                        ZStack(alignment: .bottomTrailing) {
                            Circle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Group {
                                        // Affiche l'image de profil si disponible sinon icône
                                        if let image = profileImage {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                        } else {
                                            Image(systemName: "person.fill")
                                                .font(.system(size: 50))
                                                .foregroundColor(Color("PurpleText"))
                                        }
                                    }
                                        .clipShape(Circle())
                                )
                            
                            // Bouton crayon
                            Button(action: {
                                showPhotoPicker = true
                            }) {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        Group {
                                            if #available(iOS 26.0, *) {
                                                Image(systemName: "pencil")
                                                    .foregroundColor(.black)
                                            } else {
                                                Image(systemName: "pencil")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    )
                                    .shadow(radius: 2)
                            }
                        }
                        
                        // Affiche le nom d'utilisateur
                        Text(tempName)
                            .font(.system(size: 16).width(.expanded).weight(.light))
                            .foregroundColor(Color("PurpleText"))
                        
                        // Champs éditables
                        VStack(spacing: 0) {
                            Button { showingEdit = .name } label: {
                                ProfileRow(icon: "pencil", text: "Modifier le nom")
                            }
                            Button { showingEdit = .password } label: {
                                ProfileRow(icon: "lock", text: "Modifier le mot de passe")
                            }
                            Button { showingEdit = .email } label: {
                                ProfileRow(icon: "envelope", text: "Modifier l'email")
                            }
                            
                            ToggleRow(icon: "bell", text: "Notifications", isOn: $notificationsOn)
                            ToggleRow(icon: "faceid", text: "Utiliser Face ID", isOn: $faceIDOn)
                        }
                        // Style carte avec effet verre ou arrière-plan de repli
                        .glassEffectIfAvailable(cornerRadius: 29)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding(.horizontal, 24)
                        
                        
                        // Bouton de déconnexion qui déclenche une alerte de confirmation
                        Button(action: {
                            showLogoutConfirm = true
                        }) {
                            Text("Déconnexion")
                                .font(.system(size: 16).width(.expanded).weight(.medium))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Capsule()
                                    .fill(Color("RedCustom")))
                                .padding(.horizontal, 70)
                                .padding(.bottom, 24)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToAuth) {
                if #available(iOS 26.0, *) {
                    AuthentificationView()
                } else {
                }
            }
            // Lors d'un changement de la bascule Face ID, ré-authentifier l'utilisateur ; revenir en arrière en cas d'échec
            .onChange(of: faceIDOn) { oldValue, newValue in
                if newValue {
                    authenticateUser { success, _ in
                        if !success {
                            faceIDOn = false
                        }
                    }
                }
            }
            // Présente la feuille d'édition pour le champ sélectionné, avec hauteur moyenne et indicateur de glissement
            .sheet(item: $showingEdit) { field in
                EditSheet(field: field,
                          name: $tempName,
                          email: $tempEmail,
                          password: $tempPassword,
                          onCancel: { showingEdit = nil },
                          onSave: { showingEdit = nil })
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
            // Alerte de confirmation de déconnexion avec boutons teintés en violet
            .alert("Êtes-vous sûre de vouloir vous déconnecter ?", isPresented: $showLogoutConfirm) {
                Button("Annuler", role: .cancel) {
                    showLogoutConfirm = false
                }
//                .tint(Color("PurpleText"))
//                .background(Capsule()
//                .fill(Color("PurpleText")))

                Button("Valider", role: .destructive) {
                    showLogoutConfirm = false
                    navigateToAuth = true
                }
//                .tint(Color("PurpleText"))
            }
            // Présente le sélecteur de photos lorsque déclenché
            .photosPicker(isPresented: $showPhotoPicker, selection: $selectedItem, matching: .images, preferredItemEncoding: .automatic)
            // Lorsqu'une photo est sélectionnée, charge les données de l'image de façon asynchrone et met à jour profileImage
            .onChange(of: selectedItem) { oldValue, newValue in
                guard let newValue else { return }
                Task {
                    if let data = try? await newValue.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        profileImage = uiImage
                    }
                }
            }
        
    }
}

// Ligne réutilisable affichant une icône, un libellé, un chevron et un séparateur inférieur.
struct ProfileRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        // Mise en page avec icône, texte, espaceur et chevron
        HStack {
            Image(systemName: icon)
                .symbolVariant(.fill)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("PurpleText"))
                .frame(width: 36)
            Text(text)
                .font(.system(size: 16).width(.expanded).weight(.regular))
                .foregroundColor(Color("PurpleText"))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color("PurpleText"))
        }
        .padding()
        .background(Color.clear)
        .overlay(Rectangle().frame(height: 1)
            .foregroundColor(Color.gray.opacity(0.2)), alignment: .bottom)
        
    }
}

// Ligne réutilisable avec icône, libellé et un Toggle à droite lié à un état.
// Le Toggle utilise une teinte violette.
struct ToggleRow: View {
    var icon: String
    var text: String
    @Binding var isOn: Bool
    
    var body: some View {
        // Mise en page avec icône, libellé, espaceur et un Toggle teinté
        HStack {
            Image(systemName: icon)
                .symbolVariant(.fill)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("PurpleText"))
                .frame(width: 36)
            Text(text)
                .font(.system(size: 16).width(.expanded).weight(.regular))
                .foregroundColor(Color("PurpleText"))
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Color("PurpleText"))
        }
        .padding()
        .background(Color.clear)
        .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray.opacity(0.2)), alignment: .bottom)
    }
}

// Feuille d'édition pour modifier le nom, l'email ou le mot de passe.
// Utilise un état local pour tamponner les modifications avant de les appliquer.
// Fournit des callbacks pour les actions Annuler et Enregistrer.
struct EditSheet: View {
    let field: ProfileView.EditField                   // Champ actuellement en cours d'édition
    @Binding var name: String                           // Liaison vers le nom de l'utilisateur
    @Binding var email: String                          // Liaison vers l'email de l'utilisateur
    @Binding var password: String                       // Liaison vers le mot de passe de l'utilisateur
    var onCancel: () -> Void                            // Appelé lors de l'appui sur le bouton Annuler
    var onSave: () -> Void                              // Appelé lors de l'appui sur le bouton Enregistrer
    
    // Variables d'état locales servant de tampon avant l'application lors de l'enregistrement
    @State private var localName: String = ""
    @State private var localEmail: String = ""
    @State private var localPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Titre de la feuille selon le champ à éditer
            Text(field.title)
                .font(.system(size: 18).width(.expanded).weight(.semibold))
                .foregroundColor(Color("PurpleText"))
            
            // Champ de saisie variant selon le type d'édition, avec claviers/types de contenu adaptés
            Group {
                switch field {
                case .name:
                    TextField("Nom", text: $localName)
                        .textContentType(.name)
                        .submitLabel(.done)
                        .foregroundColor(Color("PurpleText"))
                        .tint(Color("PurpleText"))
                case .email:
                    TextField("Email", text: $localEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)
                        .submitLabel(.done)
                        .foregroundColor(Color("PurpleText"))
                        .tint(Color("PurpleText"))
                case .password:
                    SecureField("Nouveau mot de passe", text: $localPassword)
                        .textContentType(.newPassword)
                        .submitLabel(.done)
                        .foregroundColor(Color("PurpleText"))
                        .tint(Color("PurpleText"))
                }
            }
            // Style d'arrière-plan avec effet verre de repli
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.6))
            )
            .glassEffectIfAvailable(cornerRadius: 12)
            
            // Boutons Annuler et Enregistrer, tous deux avec fond violet et texte blanc
            HStack(spacing: 12) {
                Button(action: {
                    onCancel()
                }) {
                    Text("Annuler")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color("PurpleText")))
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    switch field {
                    case .name: name = localName
                    case .email: email = localEmail
                    case .password: password = localPassword
                    }
                    onSave()
                }) {
                    Text("Enregistrer")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color("PurpleText")))
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 8)
            
            Spacer(minLength: 0)
        }
        .padding(20)
        // Initialise les champs locaux à partir des valeurs liées à l'apparition
        .onAppear {
            localName = name
            localEmail = email
            localPassword = ""
        }
    }
}

// Aperçu de l'écran de profil
#Preview {
    ProfileView()
}
