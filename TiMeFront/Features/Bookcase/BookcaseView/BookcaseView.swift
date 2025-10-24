//
//  BookcaseView.swift
//  TiMeFront
//
//  Created by Thibault on 25/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct BookcaseView: View {
    
    private var currentMonth: Int {
        Calendar.current.component(.month, from: Date())
    }
    
    private var currentYear: Int {
        Calendar.current.component(.year, from: Date())
    }
    
    // Calcule le nombre de "livres" (tranches de 7 jours) dans le mois
    private var numberOfBooks: Int {
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = currentYear
        components.month = currentMonth
        components.day = 1
        
        guard let firstDay = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: firstDay) else {
            return 4 // Fallback
        }
        
        let daysInMonth = range.count
        // Nombre de tranches de 7 jours + une dernière tranche si reste
        return Int(ceil(Double(daysInMonth) / 7.0))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(1...numberOfBooks, id: \.self) { bookNumber in
                    NavigationLink {
                        PrivateJournalWeekView(
                            weekNumber: bookNumber,
                            month: currentMonth,
                            year: currentYear
                        )
                    } label: {
                        VStack {
                            Image("PurpleBook")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                            
                            Text("Semaine \(bookNumber)")
                                .font(.caption)
                                .foregroundStyle(Color("PurpleText"))
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("\(monthName(currentMonth)) \(currentYear)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Helpers
    
    /// Retourne le nom du mois en français
    private func monthName(_ month: Int) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "MMMM"
        
        var components = DateComponents()
        components.month = month
        
        guard let date = Calendar.current.date(from: components) else {
            return "Mois"
        }
        
        let name = formatter.string(from: date)
        return name.prefix(1).uppercased() + name.dropFirst()
    }
}

#Preview {
    NavigationStack {
        if #available(iOS 26.0, *) {
            BookcaseView()
        } else {
            // Fallback on earlier versions
        }
    }
}
