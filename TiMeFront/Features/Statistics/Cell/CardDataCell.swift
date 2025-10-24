//
//  CardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct CardDataCell: View {
    let (width, height) : (CGFloat, CGFloat)
    //let size : CGSize
    let (nbStat, sizeS) : (Int, CGFloat)
    let (description, sizeD) : (String, CGFloat)
    
    var body: some View {
        if #available(iOS 26.0, *) {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.purpleHover.opacity(0.8))
                    .frame(width: width, height: height)
                VStack(alignment: .center, spacing: 10){
                    Text(String(nbStat))
                        .font(.system(size: 26).width(.expanded))
                    Text(description)
                        .font(.system(size:sizeD).width(.expanded))
                }
                .foregroundStyle(.white)
                .bold()
            }
            .glassEffect(
                in: RoundedRectangle(cornerRadius: 12)
            )
            .ignoresSafeArea()
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
//    CardDataCell(size: CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/8),nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8)
    CardDataCell(width: 200, height: 300,nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8)
}
