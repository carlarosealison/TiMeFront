//
//  Indicators.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 02/10/2025.
//

import SwiftUI

struct DissmissButtonView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        if #available(iOS 26.0, *) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.purpleText)
                    .font(.system(size: 20))
                    .padding()
            }
            .glassEffect(.clear)
        } else {
            Button {
                //
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundStyle(.grayPurple)
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.purpleText)
                }
                
            }
        }
        
    }
}

#Preview {
    DissmissButtonView()
}
