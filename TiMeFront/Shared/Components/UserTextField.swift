//
//  UserTextField.swift
//  TiMeFront
//
//  Created by apprenant152 on 01/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct UserTextField: View {
    @Binding var data: String
    @Binding var dataError: String?
    let label: String
    let size:(width: CGFloat, heigth: CGFloat)
    var body: some View {
        VStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .glassEffect()
                .frame(width: size.width, height: size.heigth)
                .overlay(alignment: .center) {
                    if label == "Mot de passe" || label == "Confirmer mot de passe"{
                        SecureField(text: $data) {
                            Text("\(label)")
                                .font(.system(size: 12).width(.expanded).bold())
                                .foregroundStyle(.purpleDark)
                        }
                        .padding(.horizontal, 16)
                    } else {
                        TextField(text: $data) {
                            Text("\(label)")
                                .font(.system(size: 12).width(.expanded).bold())
                                .foregroundStyle(.purpleDark)
                            
                        }
                        .padding()
                    }
                }
                .overlay(alignment: .bottomLeading) {
                    if let error = dataError, !error.isEmpty {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.redCustom)
                            .padding(.leading, 8)
                            .padding(.top, size.heigth + 2)
                            .frame(maxWidth: size.width, alignment: .leading)
                    }
                }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserTextField(
            data: .constant(""),
            dataError: .constant(""),
            label: "Mot de passe",
            size: (295, 44)
        )
    }
}
