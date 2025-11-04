    //
    //  JulyShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct JulyShelfView: View {
    let year: Int
    private let monthNumber = 7
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -125, height: 46),
                rotation: Angle(degrees: 90),
                scale: 0.82
            ),
            BookPlacement(
                offset: CGSize(width: -121, height: 11),
                rotation: Angle(degrees: 90),
                scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: -40, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.95
            ),
            BookPlacement(
                offset: CGSize(width: 5, height: 0),
                rotation: Angle(degrees: 0),
                scale: 1.1
            ),
            BookPlacement(
                offset: CGSize(width: 50, height: 5),
                rotation: Angle(degrees: 0),
                scale: 1
            ),
            BookPlacement(
                offset: CGSize(width: -20, height: -75),
                rotation: Angle(degrees: 90),
                scale: 0.79
            )
        ]
    }
    
    private var numberOfWeeks: Int {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = monthNumber
        components.day = 1
        
        guard let firstDay = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: firstDay) else {
            return 5
        }
        
        let daysInMonth = range.count
        return Int(ceil(Double(daysInMonth) / 7.0))
    }
    
    private var books: [Book] {
        (1...numberOfWeeks).map { weekNumber in
            Book(
                weekNumber: weekNumber,
                month: monthNumber,
                year: year,
                placement: allBookPlacements[weekNumber - 1]
            )
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Juillet \(year)")
                    .font(.system(size: 18, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            ZStack(alignment: .bottom) {
                ForEach(books) { book in
                    NavigationLink {
                        PrivateJournalWeekView(
                            weekNumber: book.weekNumber,
                            month: book.month,
                            year: book.year
                        )
                    } label: {
                        BookView(book: book, showInitials: true)
                    }
                    .buttonStyle(.plain)
                    .offset(book.placement.offset)
                }
                
                ShelfView(width: 350, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: -20, height: -15))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        JulyShelfView(year: 2025)
        .environment(AuthViewModel())
    }
}
