//
//  MonthShelfView.swift
//  TiMeFront
//
//  Created by Thibault on 30/10/2025.
//

import SwiftUI

/// Vue d'une étagère de mois (composant de présentation)
struct MonthShelfView: View {
    let monthData: BookcaseViewModel.MonthData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // En-tête du mois
            Text("\(monthData.monthName) \(monthData.year)")
                .font(.system(size: 24, weight: .bold))
                .fontWidth(.expanded)
                .foregroundStyle(Color("PurpleDark"))
                .padding(.leading, 20)
            
            // Étagère de livres
            HStack(spacing: 16) {
                ForEach(monthData.books) { book in
                    NavigationLink {
                        PrivateJournalWeekView(
                            weekNumber: book.weekNumber,
                            month: book.month,
                            year: book.year
                        )
                    } label: {
                        BookView(book: book)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    let monthData = BookcaseViewModel.MonthData(
        month: 10,
        year: 2025,
        books: [
            Book(weekNumber: 1, month: 10, year: 2025),
            Book(weekNumber: 2, month: 10, year: 2025),
            Book(weekNumber: 3, month: 10, year: 2025),
            Book(weekNumber: 4, month: 10, year: 2025)
        ]
    )
    
    NavigationStack {
        MonthShelfView(monthData: monthData)
    }
}