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
    @State var isSelected : Bool = false
    @Binding var emotionOTFVM : EmotionOfTheDayViewModel
    
    @State var color = ColorMapper()
    
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
                                    .glassEffect(.regular.tint(ColorMapper.color(from: stickColor)))
                                    .frame(width: 44)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .font(.system(size: 20))
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
                                    .foregroundStyle(ColorMapper.color(from: stickColor))
                                    .frame(width: 44)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .font(.system(size: 20))
                                    }
                                    .padding([.leading, .top], 45)
                            }.buttonStyle(.plain)
                        }
                }
                Text(emotion)
                    .textCards()
                    .padding([.leading, .bottom], 40)
            }
        }.task {
            do{
                await emotionOTFVM.addEmotionOfTheDay()
            }
        }
        .frame(width: 140)
    }
}

#Preview {
    MoodValidationStick(stickColor: "rose", emotion: "Peur", emotionOTFVM: .constant(EmotionOfTheDayViewModel()))
}
