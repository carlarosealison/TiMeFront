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
            VStack{
//                TitleForm(title: "Statistiques", isWelcome: false)
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
                        .frame(width: 360, height: 36)
                    }
                    .frame(width: 378, height: 36)
                    
                
                HStack{
                    textDescription(description: "Changements d'humeurs")
                }
                StatsGraphView()
                    .padding(.horizontal)
                 
                textDescription(description: "Chiffres clès")
                   
                GridCardDataCell()
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
                        .font(.system(size: 14).width(.expanded))
                        .foregroundStyle(.purpleText)
                        .bold()
                        .padding()
                        .frame( maxWidth: isFilter ? 140 : 130, maxHeight:40)
                    //.background(Color.gray)
                    // .clipShape(isFilter ? RoundedRectangle(cornerRadius: 20))
                        .animation(.linear(duration: 0.9), value: isFilter)
                        .overlay {
                            if isFilter{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .frame(width: 115, height: 28)
                                Text(name)
                                    .foregroundStyle(.purpleText)
                                    .bold()
                            }
                        }
                }
            }
        }
    }
    
    func textDescription(description: String) -> some View {
        VStack(alignment: .leading){
            Text(description)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top)
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
