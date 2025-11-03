    //
    //  FebruaryShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //


import SwiftUI

@available(iOS 26.0, *)
struct FebruaryShelfView: View {
    let year: Int
    private let monthNumber = 2
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -130, height: 46),
                rotation: Angle(degrees: 90),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: -50, height: 3),
                rotation: Angle(degrees: 0),
                scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: 0, height: 0),
                rotation: Angle(degrees: 0),
                scale: 0.9
            ),
            BookPlacement(
                offset: CGSize(width: 50, height: 5),
                rotation: Angle(degrees: 0),
                scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: 16, height: -65),
                rotation: Angle(degrees: 90),
                scale: 0.75
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
                Text("Février \(year)")
                    .font(.system(size: 18, weight: .semibold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 60)
            
            ZStack(alignment: .bottom) {
                ShelfView(width: 500, height: 15)
                    .offset(.init(width: 60, height: 0))
                    .allowsHitTesting(false)
                
                ForEach(books) { book in
                    NavigationLink {
                        PrivateJournalWeekView(
                            weekNumber: book.weekNumber,
                            month: book.month,
                            year: book.year
                        )
                    } label: {
                        BookView(book: book)
                    }
                    .buttonStyle(.plain)
                    .offset(book.placement.offset)
                }
                DecorationView(type: .buste)
                    .scaleEffect(2)
                    .offset(.init(width: 180, height: -35))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        FebruaryShelfView(year: 2025)
            .padding()
    }
}
