//
//  PurpleButton.swift
//  TiMeFront
//
//  Created by Apprenant125 on 01/10/2025.
//

import SwiftUI

struct PurpleButton: View {
    
    var viewModel = ComponentViewModel(buttonFuncText: "")
    var body: some View {
        
        Button {
            //
        } label: {
            if #available(iOS 26.0, *) {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 44)
                        .cornerRadius(90)
                        .foregroundStyle(.clear)
                        .glassEffect(.regular.tint(.purpleButton))
                        .shadow(radius: 3, y: 4)

                    Text(viewModel.buttonFuncText)
                        .foregroundStyle(.white)
                        .font(.system(size: 15, weight: .bold).width(.expanded))
                    
                }
  
            } else {
                Rectangle()
                    .frame(width: 200, height: 44)
                    .cornerRadius(90)
                    .foregroundStyle(.purpleButton)            }
        }
        
        
    }
}

#Preview {
    PurpleButton()
}
