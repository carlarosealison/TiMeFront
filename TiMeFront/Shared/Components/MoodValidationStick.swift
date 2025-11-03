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
    @State var isSelected : Bool
    @State var buttonSign : String
    
    @State var color = ColorMapper()
    
    let onValidate: () -> Void
    let onDelete: () -> Void
    
    init(stickColor: String, emotion: String, isSelected: Bool, buttonSign: String, color: ColorMapper = ColorMapper(), onValidate: @escaping () -> Void, onDelete: @escaping () -> Void) {
        self.stickColor = stickColor
        self.emotion = emotion
        self.isSelected = isSelected
        self.buttonSign = buttonSign
        self.color = color
        self.onValidate = onValidate
        self.onDelete = onDelete
    }
    
    var body: some View {
        
        HStack {
            ZStack {
                if #available(iOS 26.0, *) {
                    Capsule()
                        .glassEffect(.regular.tint(ColorMapper.color(from: stickColor)))
                        .frame(width: 44, height: 110)
                        .overlay {
                            Button {
                                isSelected.toggle()
                                
                            } label: {
                               Circle()
                                .glassEffect(.regular.tint(isSelected ? Color.green : ColorMapper.color(from: stickColor)))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: isSelected ? "checkmark" : "plus")
                                        .font(.system(size: 20))
                                        .foregroundColor(isSelected ? .black : .primary)
                                }
                                .padding([.leading, .top], 45)
                            }.buttonStyle(.plain)
                        }
                } else {
                    Capsule()
                        .frame(width: 44, height: 110)
                        .foregroundStyle(ColorMapper.color(from: stickColor))
                        .overlay {
                            Button {
                                isSelected.toggle()
                                
                            } label: {
                            Circle()
                                .foregroundStyle(isSelected ? Color.green : ColorMapper.color(from: stickColor))
                                .frame(width: 44)
                                .overlay {
                                    Image(systemName: isSelected ? "checkmark" : "plus")
                                        .font(.system(size: 20))
                                        .foregroundColor(isSelected ? .black : .primary)
                                }
                                .padding([.leading, .top], 45)
                            }.buttonStyle(.plain)
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
        .frame(width: 140)
    }
}

#Preview {
    MoodValidationStick(stickColor: "rose", emotion: "Peur", isSelected: false, buttonSign: "plus", onValidate: {}, onDelete: {})
}
