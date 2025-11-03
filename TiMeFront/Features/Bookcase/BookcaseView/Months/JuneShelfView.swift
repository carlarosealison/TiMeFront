    //
    //  JuneShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct JuneShelfView: View {
    let year: Int
    private let monthNumber = 6
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -117, height: 46),
                rotation: Angle(degrees: 90),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: -40, height: 6),
                rotation: Angle(degrees: 0),
                scale: 0.87
            ),
            BookPlacement(
                offset: CGSize(width: 10, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.91
            ),
            BookPlacement(
                offset: CGSize(width: 60, height: 7),
                rotation: Angle(degrees: 0),
                scale: 0.89
            ),
            BookPlacement(
                offset: CGSize(width: 25, height: -69),
                rotation: Angle(degrees: 90),
                scale: 0.93
            ),
            BookPlacement(
                offset: CGSize(width: -50, height: -80),
                rotation: Angle(degrees: 90),
                scale: 0.76
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
            return 4
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
                Text("Juin \(year)")
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
                    .offset(.init(width: 0, height: 0))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        JuneShelfView(year: 2025)
        .environment(AuthViewModel())
    }
}
