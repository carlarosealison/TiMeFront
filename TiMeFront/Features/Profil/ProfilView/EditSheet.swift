//
//  EditSheet.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import SwiftUI

struct EditSheet: View {
    // Le champ en cours d’édition (nom, email ou mot de passe)
    let field: ProfilView.EditField
    
    // Liaisons avec le ViewModel pour modifier les données utilisateur
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    
    // Actions appelées lors de l’annulation ou de la sauvegarde
    var onCancel: () -> Void
    var onSave: () -> Void

    // Texte temporaire saisi par l’utilisateur
    @State private var inputText: String = ""
    
    // Gestion du focus sur le champ de texte
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack {
            // Fond noir semi-transparent derrière la popup
            Color.white.opacity(0.45)
                .ignoresSafeArea() // recouvre tout l’écran
                .onTapGesture {
                    // Ferme la popup si l’utilisateur tape à l’extérieur
                    onCancel()
                }

            // Conteneur principal centré
            VStack {
                //  Fenêtre principale du popup (centré)
                VStack(spacing: 25) {
                    // --- Titre selon le champ édité (ex: “Modifier le nom”) ---
                    Text(field.title)
                        .font(Font.custom("SF Pro", size: 22))
                        .foregroundColor(Color("PurpleText"))

                    //  Champ de texte
                    TextField("Entrez votre \(labelText(field))", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                        .focused($isFocused)
                        .padding(.horizontal)
                        .onAppear {
                            // Pré-remplit le champ avec la valeur actuelle
                            switch field {
                            case .name: inputText = name
                            case .email: inputText = email
                            case .password: inputText = password
                            }

                            // Active automatiquement le clavier après un court délai
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isFocused = true
                            }
                        }

                    //  Boutons “Annuler” et “Enregistrer” côte à côte 
                    HStack(spacing: 20) {
                        // Bouton Annuler
                        Button("Annuler") {
                            onCancel()
                        }
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(Color.white.opacity(0.15))
                        .clipShape(Capsule())
                        .font(Font.custom("SF Pro", size: 19))

                        // Bouton Enregistrer
                        Button("Enregistrer") {
                            // Met à jour le champ correspondant
                            switch field {
                            case .name: name = inputText
                            case .email: email = inputText
                            case .password: password = inputText
                            }
                            onSave()
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(Color("PurpleButton"))
                        .clipShape(Capsule())
                        .shadow(
                            color: Color("PurpleDark").opacity(0.5),
                            radius: 10, x: 0, y: 4
                        )
                        .font(Font.custom("SF Pro", size: 19))
                    }
                    .padding(.top, 10)
                }
                .padding(24)
                .frame(maxWidth: 360)
                .fixedSize(horizontal: false, vertical: true)
                // Fond uniforme pour une couleur toujours identique
                .background(
                    Color("PurpleHover")
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 10)
                // Transition et animation type popup centré
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(response: 0.35, dampingFraction: 0.85), value: field)
            }
        }
    }

    //  Fonction utilitaire : texte du placeholder
    private func labelText(_ field: ProfilView.EditField) -> String {
        switch field {
        case .name: return "nom"
        case .email: return "email"
        case .password: return "mot de passe"
        }
    }
}

//  Extension pour arrondir uniquement certains coins
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

//  Forme personnalisée pour les coins sélectionnés
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
#Preview {
    EditSheet(
        field: .name,
        name: .constant(""),
        email: .constant(""),
        password: .constant(""),
        onCancel: {},
        onSave: {}
    )
}
