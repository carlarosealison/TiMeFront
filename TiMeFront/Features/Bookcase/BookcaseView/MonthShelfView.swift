//
//  MonthShelfView.swift
//  TiMeFront
//

import SwiftUI

@available(iOS 26.0, *)
struct MonthShelfView: View {
    let monthData: BookcaseViewModel.MonthData
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(monthData.monthName) \(monthData.year)")
                .font(.system(size: 18, weight: .bold))
                .fontWidth(.expanded)
                .foregroundStyle(Color("PurpleDark"))
                .padding(.bottom, 10)
            
            HStack(spacing: 12) {
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
            .padding(.bottom, 10)
            
            ShelfView()
                .padding(.horizontal, 10)
        }
    }
}

