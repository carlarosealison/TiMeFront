//
//  ButtonView.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 25/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct ButtonForm: View {
    let title: String
    let isImage: Bool
    var action: () -> Void = {}
    var body: some View {
            Button {
                action()
            } label: {
                HStack{
                    Text(title)
                        .font(.system(size: 16).width(.expanded))
                        .foregroundStyle(.whitePurple)
                        .bold()
                        .frame(width: 130, height:32)
                        .padding()
                    if isImage{
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(.whitePurple)
                            .frame(width: 9, height: 13)
                            .padding()
                    }
                        
                }
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.purpleButton)
                        .glassEffect()

                }
                .frame(width: 200, height: 44)
                
            }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ButtonForm(title: "Suivant", isImage: true)
    } else {
        // Fallback on earlier versions
    }
}
