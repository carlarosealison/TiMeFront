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
    
    let (smallNbStat, sizeSS) : (Int, CGFloat)
    let (smallDescription, sizeSD) : (String, CGFloat)
    
    var body: some View {
        if #available(iOS 26.0, *) {
            
            RoundedRectangle(cornerRadius: 12)
                .fill(.purpleHover.opacity(0.8))
                .frame(width: width, height: height)
                .overlay{
                    
                        contentCard(nbStat: nbStat, description: description, sizeS: sizeS, sizeD: sizeD)
                        if isLargeCard{
                            HStack(spacing: 180){
                                contentCard(nbStat: smallNbStat, description: smallDescription, sizeS: sizeSS, sizeD: sizeSD)
                                
                                contentCard(nbStat: smallNbStat, description: smallDescription, sizeS: sizeSS, sizeD: sizeSD)
                            }
                            .frame(height: 120, alignment: .bottom)
                        }
                    
                }
                .foregroundStyle(.white)
                .bold()
            
                .glassEffect(
                    in: RoundedRectangle(cornerRadius: 12)
                )
                .ignoresSafeArea()
        } else {
            // Fallback on earlier versions
        }
    }
    
    func contentCard(nbStat: Int, description: String, sizeS: CGFloat, sizeD: CGFloat) -> some View{
        VStack(alignment: .center, spacing: 4){
            Text(String(nbStat))
                .font(.system(size: sizeS).width(.expanded))
            Text(description)
                .font(.system(size:sizeD).width(.expanded))
        }
    }
    
    
}

#Preview {
    //    CardDataCell(size: CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/8),nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8)
    CardDataCell(width: 295, height: 143,nbStat: 54, sizeS: 26, description: "Stricks max", sizeD: 8, isLargeCard: true, smallNbStat: 12, sizeSS: 12, smallDescription: "Ce mois", sizeSD: 8)
}
