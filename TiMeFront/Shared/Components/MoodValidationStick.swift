//
//  MoodValidationStick.swift
//  TiMeFront
//
//  Created by Carla on 23/10/2025.
//

import SwiftUI

struct MoodValidationStick: View {
    @State var stickColor : String
    @State var emotion : String
    var isSelected: Bool 
    var onTap: () -> Void  //  Action à exécuter au tap
    
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
                                .glassEffect(.regular.tint(isSelected ? Color.green : ColorMapper.color(from: stickColor)))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: isSelected ? "checkmark" : "plus")
                                        .font(.system(size: 20))
                                        .foregroundColor(isSelected ? .black : .primary)
                                }
                                .padding([.leading, .top], 45)

                        }
                } else {
                    Capsule()
                        .frame(width: 44, height: 110)
                        .foregroundStyle(ColorMapper.color(from: stickColor))
                        .overlay {
                            Circle()
                                .foregroundStyle(isSelected ? Color.green : ColorMapper.color(from: stickColor))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: isSelected ? "checkmark" : "plus")
                                        .font(.system(size: 20))
                                        .foregroundColor(isSelected ? .black : .primary)
                                }
                                .padding([.leading, .top], 45)
                        }
                        
                }
                
                Text(emotion)
                    .textCards()
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.3)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(1)
                    .padding([.leading, .bottom], 40)
                
            }
        }
        .onTapGesture {
            onTap()  //  Appelle l'action fournie par le parent
        }
    }
}

#Preview {
    MoodValidationStick(stickColor: "rose", emotion: "Peur", isSelected: false, onTap: {})
}
