//
//  NovemberShelfView.swift
//  TiMeFront
//
//  Created by Thibault on 01/11/2025.
//


import SwiftUI

@available(iOS 26.0, *)
struct NovemberShelfView: View {
    let year: Int
    private let monthNumber = 11
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -139, height: 44),
                rotation: Angle(degrees: 90),
                scale: 0.9
            ),
            BookPlacement(
                offset: CGSize(width: -55, height: 20),
                rotation: Angle(degrees: 0),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: -5, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.91
            ),
            BookPlacement(
                offset: CGSize(width: 43, height: 7),
                rotation: Angle(degrees: 0),
                scale: 0.99
            ),
            BookPlacement(
                offset: CGSize(width: 90, height: -5),
                rotation: Angle(degrees: 0),
                scale: 1
            ),
            BookPlacement(
                offset: CGSize(width: -70, height: -75),
                rotation: Angle(degrees: 90),
                scale: 0.78
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
                Text("Novembre \(year)")
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
                        BookView(book: book)
                    }
                    .buttonStyle(.plain)
                    .offset(book.placement.offset)
                }
                
                ShelfView(width: 380, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: -50, height: 0))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NovemberShelfView(year: 2025)
            .padding()
    }
}
