//
//  ProfilView.swift
//  TiMeFront
//
//  Created by Mounir on 26/09/2025.
//

//import SwiftUI
//import LocalAuthentication
//
//// Compatibility: Apply Liquid Glass on iOS 26+, fallback to rounded background otherwise
//extension View {
//    @ViewBuilder
//    func glassEffectIfAvailable(cornerRadius: CGFloat = 15) -> some View {
//        if #available(iOS 26.0, *) {
//            self.glassEffect(.regular.tint(.white.opacity(0.2)), in: .rect(cornerRadius: cornerRadius))
//        } else {
//            self.background(
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .fill(Color.white.opacity(0.6))
//            )
//        }
//    }
//}
//
//func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
//    let context = LAContext()
//    context.localizedCancelTitle = "Annuler"
//    var error: NSError?
//
//    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//        let reason = "Nous avons besoin de confirmer votre identité."
//        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evalError in
//            DispatchQueue.main.async {
//                completion(success, evalError)
//            }
//        }
//    } else {
//        DispatchQueue.main.async {
//            completion(false, error)
//        }
//    }
//}
//
//struct ProfileView: View {
//    @State private var notificationsOn = false
//    @State private var faceIDOn = false
//    
//    var body: some View {
//        ZStack{
//            Image("Background")
//                .resizable()
//                .ignoresSafeArea()
//                        
//            VStack(spacing: 35) {
//                ZStack(alignment: .bottomTrailing) {
//                    Circle()
//                        .fill(Color.gray.opacity(0.4))
//                        .frame(width: 100, height: 100)
//                        .overlay(
//                            Image(systemName: "person.fill")
//                                .font(.system(size: 50))
//                                .foregroundColor(Color("PurpleText"))
//                        )
//                    
//                    Button(action: {
//                    }) {
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 30, height: 30)
//                            .overlay(
//                                Group {
//                                    if #available(iOS 26.0, *) {
//                                        Image(systemName: "pencil")
//                                            .glassEffect()
//                                            .foregroundColor(.black)
//                                    } else {
//                                        Image(systemName: "pencil")
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                            )
//                            .shadow(radius: 2)
//                    }
//                }
//                
//                Text("Carla Paul")
//                    .font(.system(size: 16).width(.expanded).weight(.light))
//                    .foregroundColor(.black)
//                
//                VStack(spacing: 0) {
//                    ProfileRow(icon: "pencil", text: "Modifier le nom")
//                    ProfileRow(icon: "lock", text: "Modifier le mot de passe")
//                    ProfileRow(icon: "envelope", text: "Modifier l'email")
//                    
//                    ToggleRow(icon: "bell", text: "Notifications", isOn: $notificationsOn)
//                    ToggleRow(icon: "faceid", text: "Utiliser Face ID", isOn: $faceIDOn)
//                }
//                .glassEffectIfAvailable(cornerRadius: 15)
//                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//                .padding(.horizontal, 24)
//                
//                
//                Spacer()
//                
//                Button(action: {
//                }) {
//                    Text("Déconnexion")
//                        .font(.system(size: 16).width(.expanded).weight(.medium))
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Capsule()
//                        .fill(Color.red))
//                        .padding(.horizontal, 50)
//                        .padding(.bottom, 24)
//                }
//            }
//        }
//        .onChange(of: faceIDOn) { oldValue, newValue in
//            if newValue {
//                authenticateUser { success, _ in
//                    if !success {
//                        faceIDOn = false
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ProfileRow: View {
//    var icon: String
//    var text: String
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .symbolVariant(.fill)
//                .font(.system(size: 20, weight: .semibold))
//                .foregroundColor(.black)
//                .frame(width: 36)
//            Text(text)
//                .font(.system(size: 16).width(.expanded).weight(.regular))
//            Spacer()
//            Image(systemName: "chevron.right")
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .background(Color.clear)
//        .overlay(Rectangle().frame(height: 1)
//        .foregroundColor(Color.gray.opacity(0.2)), alignment: .bottom)
//        
//    }
//}
//
//struct ToggleRow: View {
//    var icon: String
//    var text: String
//    @Binding var isOn: Bool
//    
//    var body: some View {
//        HStack {
//            Image(systemName: icon)
//                .symbolVariant(.fill)
//                .font(.system(size: 20, weight: .semibold))
//                .foregroundColor(.black)
//                .frame(width: 36)
//            Text(text)
//                .font(.system(size: 16).width(.expanded).weight(.regular))
//            Spacer()
//            Toggle("", isOn: $isOn)
//                .labelsHidden()
//        }
//        .padding()
//        .background(Color.clear)
//        .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray.opacity(0.2)), alignment: .bottom)
//    }
//}
//
//#Preview {
//    ProfileView()
//}
