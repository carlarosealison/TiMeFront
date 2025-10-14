//
//  StatisticsView.swift
//  TiMeFront
//
//  Created by Thibault on 03/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct StatisticsView: View {
    @State var dateSelect : DateType = .week
    
    enum DateType {
        case week
        case month
        case year
    }
    
    var body: some View {
        ZStack{
            GradientBackgroundView()
            VStack(spacing: 50){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.2))
                    //.glassEffect()
                    .overlay {
                        HStack{
                            ButtonFilter(name: "Semaine", isFilter: dateSelect == .week) {
                                dateSelect = .week
                            }
                            Divider()
                            ButtonFilter(name: "Mois", isFilter: dateSelect == .month) {
                                dateSelect = .month
                            }
                            Divider()
                            ButtonFilter(name: "Année", isFilter: dateSelect == .year) {
                                dateSelect = .year
                            }
                        }
                    }
                    .frame(width: 370, height: 50)
                HStack{
                    Text("Changements d’humeurs ")
                        .font(.system(size: 16).width(.expanded))
                    Spacer()
                }
                .padding(.leading)
                StatsGraphView()
            }
        }
        .navigationTitle("Mes statistique")
    }
    
    struct ButtonFilter: View {
        let name: String
        let isFilter : Bool
        let action: ()-> Void
        var body: some View {
            HStack{
                Button {
                    action()
                } label: {
                    Text(name)
                        .foregroundStyle(.purpleText)
                        .bold()
                        .padding()
                        .frame( maxWidth: isFilter ? 140 : 130, maxHeight: isFilter ? 43 : 40)
                    //.background(Color.gray)
                    // .clipShape(isFilter ? RoundedRectangle(cornerRadius: 20))
                        .animation(.linear(duration: 0.9), value: isFilter)
                        .overlay {
                            if isFilter{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                Text(name)
                                    .foregroundStyle(.purpleText)
                                    .bold()
                            }
                        }
                }
                
            }
            
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        StatisticsView()
    } else {
        // Fallback on earlier versions
    }
}
