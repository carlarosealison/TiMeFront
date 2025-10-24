//
//  StatisticsView.swift
//  TiMeFront
//
//  Created by Thibault on 03/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct StatisticsView: View {
    @Environment(AuthViewModel.self) var authVM
    @State var statVM = StatisticsViewModel()
    
    var body: some View {
        ZStack{
            GradientBackgroundView()
            VStack(spacing: 30){
                TitleForm(title: "Statistiques", isWelcome: false)
                
                headerFilterDate
                
                chartOrCardsData(type: .chart)
                
                chartOrCardsData(type: .card)
                
            }
            .padding(.top)
        }
        .frame(width: .infinity, height: .infinity)
        .ignoresSafeArea()
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
    
    func textDescription(description: String, isShowInfo: Bool) -> some View {
        VStack(alignment: .leading){
            HStack{
                Text(description)
                if isShowInfo{
                    Image(systemName: "info.circle")
                        .onTapGesture {
                            statVM.isShowPopCategoryEmotion.toggle()
                        }
                        .popover(
                            isPresented: $statVM.isShowPopCategoryEmotion,
                            attachmentAnchor: .point(.bottom)
                        ) {
                            EmotionCategoryView()
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                                .presentationCompactAdaptation(.popover)
                        }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
        }
    }
    
    var headerFilterDate: some View{
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray.opacity(0.2))
        //.glassEffect()
            .overlay {
                HStack{
                    ButtonFilter(name: "Semaine", isFilter: statVM.dateSelect == .week) {
                        statVM.dateSelect = .week
                    }
                    Divider()
                    ButtonFilter(name: "Mois", isFilter: statVM.dateSelect == .month) {
                        statVM.dateSelect = .month
                    }
                    Divider()
                    ButtonFilter(name: "Année", isFilter: statVM.dateSelect == .year) {
                        statVM.dateSelect = .year
                    }
                }
                .frame(width: 360, height: 36)
            }
            .frame(width: 378, height: 36)
    }
    
    @ViewBuilder
    func chartOrCardsData(type: StatisticsViewModel.StatsType) -> some View{
        switch type{
        case .chart:
            VStack{
                textDescription(description: "Changements d'humeurs", isShowInfo: true)
                StatsGraphView()
                    .padding(.horizontal)
            }
        case .card:
            VStack{
                textDescription(description: "Chiffres clès", isShowInfo: false)
                
                GridCardDataCell(streak: statVM.streak, challengeSuccessful: statVM.challengeNumber)
            }
            .task {
                // injecte l'instance AuthViewModel que tu as dans l'environnement
                statVM.authVM = authVM
                // appelle la méthode pour lire streak et challengeNumber
                await statVM.streakTotal()
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        StatisticsView()
            .environment(AuthViewModel())
    } else {
        // Fallback on earlier versions
    }
}
