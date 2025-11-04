//
//  ScrollMotivation.swift
//  TiMeFront
//
//  Created by Apprenant125 on 23/10/2025.
//

import SwiftUI

struct ScrollMotivation: View {
   @Binding var viewModel: JournalEditorViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("\(viewModel.tempValue)")
                    .font(.system(size: 40))
                    .fontWidth(.expanded)
                    .foregroundStyle(.purpleText)
                    .contentTransition(.numericText())
                    .sensoryFeedback(.selection, trigger: viewModel.tempValue)
                
                Text("%")
                    .font(.system(size: 12))
                    .fontWidth(.expanded)
                    .fontWeight(.semibold)
                    .padding(.top)
                
            }.padding(.leading)
            
            GeometryReader { geo in
                //établit le centre de l'écran
                let center = geo.size.width / 2

                
                //met en place chaque tiret de la graduation
                ForEach(viewModel.range, id: \.self) { tick in
                    let x = center + CGFloat(tick - viewModel.value) * viewModel.stepWidth + viewModel.dragOffset
                    
                    VStack {
                        //mise en place des ticks
                        RoundedRectangle(cornerRadius: 10)
                            .fill(tick == viewModel.tempValue ? Color.purpleText : Color.gray.opacity(0.4))
                            .frame(width: tick == viewModel.tempValue ? 3 : 1, height: tick % 5 == 0 ? 20 : 10)
                        //mise en place des chiffres correspondant aux ticks
                        Text("\(tick)")
                            .fontWidth(.expanded)
                            .fontWeight(.semibold)
                            .foregroundStyle(tick % 5 == 0 ? (.purpleText) : .clear)
                            .offset(y: 10)
                    }.position(x: x, y: 0) // observation sur la position
                    
                }.contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0) //mise en place du dragGesture
                            .onChanged({ gesture in
                                withAnimation(.interactiveSpring){
                                    
                                    let rawOffset = gesture.translation.width
                                    let offsetSteps = rawOffset / viewModel.stepWidth
                                    var projected = CGFloat(viewModel.value) - offsetSteps
                                    let lower = CGFloat(viewModel.range.lowerBound)
                                    let upper = CGFloat(viewModel.range.upperBound)
                                    
                                    if projected < lower {
                                        let overshoot = lower - projected
                                        projected = lower - log(overshoot + 1) * 2
                                    } else if projected > upper {
                                        let overshoot = projected - upper
                                        projected = upper + log(overshoot + 1) * 2
                                    }
                                    
                                    viewModel.dragOffset = (CGFloat(viewModel.value) - projected) * viewModel.stepWidth
                                    let rounded = Int(projected.rounded())
                                    viewModel.tempValue = rounded.clamped(to: viewModel.range)
                                    
                                }
                            })
                        
                            .onEnded({ gesture in
                                let offsetSteps = gesture.translation.width / viewModel.stepWidth
                                let finalValue = Int((CGFloat(viewModel.value) - offsetSteps).rounded()).clamped(to: viewModel.range)
                                withAnimation(.interpolatingSpring(stiffness: 120, damping: 20)){
                                    viewModel.value = finalValue
                                    viewModel.tempValue = finalValue
                                    viewModel.dragOffset = 0
                                }
                            })
                    )
                
            }
        }
        
        
    }
}
extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

#Preview {
    ScrollMotivation(viewModel: .constant(JournalEditorViewModel()))
}
