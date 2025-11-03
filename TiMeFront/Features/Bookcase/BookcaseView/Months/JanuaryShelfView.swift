//
//  JanuaryShelfView.swift
//  TiMeFront
//
//  Created by Thibault on 01/11/2025.
//


import SwiftUI

@available(iOS 26.0, *)
struct JanuaryShelfView: View {
    let year: Int
    private let monthNumber = 1
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                    offset: CGSize(width: -120, height: 8),
                    rotation: Angle(degrees: 0),
                    scale: 0.8
            ),
            BookPlacement(
                    offset: CGSize(width: -70, height: 10),
                    rotation: Angle(degrees: 0),
                    scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: -22, height: 1),
                rotation: Angle(degrees: 0),
                scale: 0.9
            ),
            BookPlacement(
                    offset: CGSize(width: 55, height: 12),
                    rotation: Angle(degrees: 90),
                    scale: 0.75
            ),
            BookPlacement(
                    offset: CGSize(width: 64, height: 45),
                    rotation: Angle(degrees: 90),
                    scale: 0.85
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
                Text("Janvier \(year)")
                    .font(.system(size: 18, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 40)
            .allowsHitTesting(false)
            
            ZStack(alignment: .bottom) {
                ShelfView(width: 450, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: -10, height: 0))
                
                ForEach(books.reversed()) { book in
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
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        JanuaryShelfView(year: 2025)
            .padding()
    }
}
