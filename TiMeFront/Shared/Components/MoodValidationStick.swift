//
//  MoodValidationStick.swift
//  TiMeFront
//
//  Created by Apprenant125 on 23/10/2025.
//

import SwiftUI

struct MoodValidationStick: View {
    @State var stickColor : String
    @State var emotion : String
    
    @State var color = ColorMapper()
    
    var body: some View {
        
        VStack {
            ZStack {
                
                if #available(iOS 26.0, *) {
                    Capsule()
                        .glassEffect(.regular.tint(ColorMapper.color(from: stickColor)))
                        .frame(width: 44, height: 110)
                        .overlay {
                            
                            Circle()
                                .glassEffect(.regular.tint(ColorMapper.color(from: stickColor)))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20))
                                }
                                .padding([.leading, .top], 45)

                        }
                } else {
                    Capsule()
                        .frame(width: 44, height: 110)
                        .foregroundStyle(ColorMapper.color(from: stickColor))
                        .overlay {
                            Circle()
                                .foregroundStyle(ColorMapper.color(from: stickColor))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20))
                                }
                                .padding([.leading, .top], 45)
                        }
                        
                }
                Text(emotion)
                    .textCards()
                    .padding([.leading, .bottom], 40)
//                    .border(.red)
//                    .frame(alignment: .trailing)
            }
        }
    }
}

#Preview {
    MoodValidationStick(stickColor: "rose", emotion: "Peur")
}
