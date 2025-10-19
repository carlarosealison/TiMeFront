//
//  PrivateJournalWeekView.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

struct PrivateJournalWeekView: View {
    
    let weekNumber: Int
        let month: Int
        let year: Int
    
    @State private var currentDayIndex: Int = 0
    
    private var weekDates: [Date] {
        calculateWeekDates(weekNumber: weekNumber, month: month, year: year)
    }
    
    private var currentDate: Date {
        weekDates[currentDayIndex]
    }
    
    private var navigationTitleText: String {
        formatDate(currentDate)
    }
    
    var body: some View {
        ZStack {
            // Image du livre
            Image("Journal")
                .resizable()
                .scaledToFit()
                .frame(width: 755, height: 620)
                .padding(.leading, 360)
                .padding(.top, 20)
            
            // Contenu centré sur le livre
            VStack(alignment: .leading, spacing: 24) {
                
                // Section Ressentis
                Text("Ressentis")
                    .semiBoldCondensedTitle()
                
                HStack(spacing: 20) {
                    DashboardCard {
                        IconCardContent(icon: "heart", color: Color(.purpleButton), size: .large)
                    }
                    .frame(width: 75, height: 75)
                    
                    DashboardCard {
                        IconCardContent(text: "Fatiguée", color: Color(.purpleText), size: .tiny)
                    }
                    .frame(width: 75, height: 75)
                    
                    DashboardCard {
                        IconCardContent(text: "60%", color: Color(.purpleButton), size: .regularPurple)
                    }
                    .frame(width: 75, height: 75)
                }
                
                // Section Rédaction
                Text("Rédaction")
                    .semiBoldCondensedTitle()
                    .padding(.top, 12)
                
                Text("Aujourd'hui, je me suis embrouillé avec mon mec parce qu'il a pas fait la vaisselle ce gros macho en plus y'a Catherine de la compta qui fait que me demander quand je revient de vacances c'est trop la loose")
                    .textCards()
                    .padding()
                    .lineSpacing(4)
                    .frame(width: 250, height: 220, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(20)
            }
            .frame(width: 350)
            .padding(.top, 50)
            .padding(.leading, 30)
        }
        .background {
            Image("BackgroundDots")
                .resizable()
                .scaledToFill()
                .scaleEffect(0.40)
                .ignoresSafeArea()
        }
        .navigationTitle(navigationTitleText)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func calculateWeekDates(weekNumber: Int, month: Int, year: Int) -> [Date] {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDayOfMonth = calendar.date(from: components) else { return [] }
        
        var currentDate = firstDayOfMonth
        while calendar.component(.weekday, from: currentDate) != 2 {
            guard let nextDay = calendar.date(byAdding: .day, value: 1, to: currentDate) else { return [] }
            currentDate = nextDay
        }
        
        guard let weekStartDate = calendar.date(byAdding: .weekOfYear, value: weekNumber - 1, to: currentDate) else { return [] }
        
        return (0..<7).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: weekStartDate)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "EEEE dd MMMM"
        let formatted = formatter.string(from: date)
        return formatted.prefix(1).uppercased() + formatted.dropFirst()
    }
}

#Preview {
    NavigationStack {
        PrivateJournalWeekView(
            weekNumber: 2,
            month: 1,
            year: 2025
        )
    }
}
