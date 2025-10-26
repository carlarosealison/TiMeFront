//
//  CardDataCell.swift
//  TiMeFront
//
//  Created by apprenant152 on 14/10/2025.
//

import SwiftUI

struct CardDataCell: View {
    
    let (width, height) : (CGFloat, CGFloat)
    let (nbStat, sizeS) : (Int, CGFloat)
    let (description, sizeD) : (String, CGFloat)
    var isLargeCard: Bool
    var body: some View {
        if #available(iOS 26.0, *) {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.purpleHover.opacity(0.8))
                    .frame(width: width, height: height)
                VStack{
                    contentCard(nbStat: nbStat, description: description)
                
                    if isLargeCard{
                        HStack(spacing: 100){
                            contentCard(nbStat: nbStat, description: description)
                            contentCard(nbStat: nbStat, description: description)
                        }
                    }
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
    
    func contentCard(nbStat: Int, description: String) -> some View{
        VStack(alignment: .center, spacing: 10){
            Text(String(nbStat))
                .font(.system(size: sizeS).width(.expanded))
            Text(description)
                .font(.system(size:sizeD).width(.expanded))
        }
    }
    
    
}

#Preview {
//    CardDataCell(size: CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/8),nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8)
    CardDataCell(width: 295, height: 143,nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8, isLargeCard: false)
}
