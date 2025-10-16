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
                .frame(height: 44)
                .overlay(alignment: .center, content: {
                    if label == "Mot de passe" || label == "Confirmer mot de passe"{
                        SecureField(text: $data) {
                            Text("\(label)")
                                .font(.system(size: 12).width(.expanded).bold())
                                .foregroundStyle(.purpleDark)
                        }
                        .padding()
                    }else{
                        TextField(text: $data) {
                            Text("\(label)")
                                .font(.system(size: 12).width(.expanded).bold())
                                .foregroundStyle(.purpleDark)
                            
                        }
                        .padding()

                    }
                
               
            })
                .frame(width: size.width, height: size.heigth)
            messageError
        }
    }
    
    var messageError: some View{
        Text(dataError ?? " ")
            .font(.caption)
            .foregroundColor(.redCustom)
            .frame(height: 14)
            .padding(.leading, 8)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        UserTextField(data: .constant(""), dataError: .constant(""), label: "Mot de passe", size: (280, 44))
    } else {
        // Fallback on earlier versions
    }
}
