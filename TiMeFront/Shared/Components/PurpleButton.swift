//
//  PurpleButton.swift
//  TiMeFront
//
//  Created by Apprenant125 on 01/10/2025.
//

import SwiftUI

struct PurpleButton: View {
    var withArrow : Bool
    var buttonFuncText : String
    
    var body: some View {
            if #available(iOS 26.0, *) {
                
                Rectangle()
                    .frame(width: 200, height: 44)
                    .cornerRadius(90)
                    .foregroundStyle(.clear)
                    .glassEffect(.regular.tint(.purpleButton))
                    .overlay {
                        
                        Text(buttonFuncText)
                                .foregroundStyle(.white)
                                .font(.system(size: 15, weight: .bold).width(.expanded))
                    }
                    .overlay {
                        if withArrow {
                            HStack {
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .padding(.trailing, 25)
                            }
                        }

                        }
            } else {
                
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 44)
                        .cornerRadius(90)
                        .foregroundStyle(.purpleButton)
                    
                    Text(buttonFuncText)
                        .foregroundStyle(.white)
                        .font(.system(size: 15, weight: .bold).width(.expanded))
                }
            }
    }
}

#Preview {
    PurpleButton(withArrow: true, buttonFuncText: "Suivant")
}
