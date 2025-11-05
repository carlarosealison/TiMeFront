//
//  EditSheet.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import SwiftUI

struct EditSheet: View {
    let field: ProfilView.EditField

    @Binding var name: String
    @Binding var email: String
    @Binding var password: String

    var onCancel: () -> Void
    var onSave: () -> Void

    @State private var inputText: String = ""

    @FocusState private var isFocused: Bool

    @State private var showPassword: Bool = false
    @State private var currentPasswordInput: String = ""
    @State private var newPasswordInput: String = ""
    @State private var showCurrentPassword: Bool = false
    @State private var showNewPassword: Bool = false

    var body: some View {
        ZStack {
            Color.white.opacity(0.45)
                .ignoresSafeArea()
                .onTapGesture {
                    onCancel()
                }

            VStack {
                VStack(spacing: 25) {
                    Text(field.title)
                        .fontWidth(.expanded)
                        .foregroundColor(Color("PurpleText"))

                    VStack(alignment: .leading, spacing: 12) {
                        if case .email = field {
                            Text("Email actuel: " + email)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.9))

                            TextField("Nouvel email", text: $inputText)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .autocorrectionDisabled(true)
                                .padding(10)
                                .background(Color.white.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        } else if case .password = field {
                            VStack(spacing: 10) {
                                HStack {
                                    Group {
                                        if showCurrentPassword {
                                            TextField("Mot de passe actuel", text: $currentPasswordInput)
                                        } else {
                                            SecureField("Mot de passe actuel", text: $currentPasswordInput)
                                        }
                                    }
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled(true)

                                    Button(action: { showCurrentPassword.toggle() }) {
                                        Image(systemName: showCurrentPassword ? "eye.slash" : "eye")
                                            .foregroundColor(.white.opacity(0.85))
                                    }
                                    .accessibilityLabel(showCurrentPassword ? "Masquer le mot de passe actuel" : "Afficher le mot de passe actuel")
                                }
                                .padding(10)
                                .background(Color.white.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                                HStack {
                                    Group {
                                        if showNewPassword {
                                            TextField("Nouveau mot de passe", text: $newPasswordInput)
                                        } else {
                                            SecureField("Nouveau mot de passe", text: $newPasswordInput)
                                        }
                                    }
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled(true)

                                    Button(action: { showNewPassword.toggle() }) {
                                        Image(systemName: showNewPassword ? "eye.slash" : "eye")
                                            .foregroundColor(.white.opacity(0.85))
                                    }
                                    .accessibilityLabel(showNewPassword ? "Masquer le nouveau mot de passe" : "Afficher le nouveau mot de passe")
                                }
                                .padding(10)
                                .background(Color.white.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            }

                        } else {
                            TextField("Entrez votre \(labelText(field))", text: $inputText)
                                .padding(10)
                                .background(Color.white.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
                        switch field {
                        case .name:
                            inputText = name
                        case .email:
                            inputText = email
                        case .password:
                            inputText = ""
                            currentPasswordInput = ""
                            newPasswordInput = ""
                        }
                    }

                    HStack(spacing: 20) {
                        Button("Annuler") {
                            onCancel()
                        }
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(Color.white.opacity(0.15))
                        .clipShape(Capsule())
                        .fontWidth(.expanded)

                        Button("Enregistrer") {
                            // Met à jour le champ correspondant
                            switch field {
                            case .name: name = inputText
                            case .email: email = inputText
                            case .password: password = newPasswordInput
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
                        .fontWidth(.expanded)
                    }
                    .padding(.top, 10)
                }
                .padding(24)
                .frame(maxWidth: 360)
                .fixedSize(horizontal: false, vertical: true)
                .background(
                    Color("PurpleHover")
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 10)
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(response: 0.35, dampingFraction: 0.85), value: field)
            }
        }
    }

    func labelText(_ field: ProfilView.EditField) -> String {
        switch field {
        case .name: return "nom"
        case .email: return "email"
        case .password: return "mot de passe"
        }
    }
}

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

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
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
