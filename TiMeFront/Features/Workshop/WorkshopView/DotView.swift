//
//  DotView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 21/10/2025.
//

import SwiftUI

struct DotView: View {
    var body: some View {
        VStack (spacing: 6){
            
            ForEach(1...3, id: \.self) { y in
                HStack (spacing: 4){
                    ForEach(1...2, id: \.self) { i in
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 6)
                    }
                }
            }

        }
    }
}

#Preview {
    DotView()
}
