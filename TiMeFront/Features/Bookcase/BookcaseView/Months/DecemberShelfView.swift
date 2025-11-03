//
//  DecemberShelfView.swift
//  TiMeFront
//
//  Created by Thibault on 01/11/2025.
//


import SwiftUI

@available(iOS 26.0, *)
struct DecemberShelfView: View {
    let year: Int
    private let monthNumber = 12
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: 44, height: 110),
                rotation: Angle(degrees: 90),
                scale: 0.98
            ),
            BookPlacement(
                offset: CGSize(width: 3, height: 110),
                rotation: Angle(degrees: 90),
                scale: 0.96
            ),
            BookPlacement(
                offset: CGSize(width: -40, height: 110),
                rotation: Angle(degrees: 90),
                scale: 0.94
            ),
            BookPlacement(
                offset: CGSize(width: 6, height: 0),
                rotation: Angle(degrees: -25),
                scale: 0.92
            ),
            BookPlacement(
                offset: CGSize(width: 48, height: 15),
                rotation: Angle(degrees: -25),
                scale: 0.92
            ),
            BookPlacement(
                offset: CGSize(width: -30, height: -75),
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
                Text("Décembre \(year)")
                    .font(.system(size: 18, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 40)
            
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
                            .offset(book.placement.offset)
                            .rotationEffect(book.placement.rotation)
                            .scaleEffect(book.placement.scale)
                    }
                    .buttonStyle(.plain)
                }
                
                DecorationView(type: .cactus)
                    .scaleEffect(1.6)
                    .offset(.init(width: 150, height: -30))
                
                ShelfView(width: 420, height: 15)
                    .allowsHitTesting(false)
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        DecemberShelfView(year: 2025)
            .padding()
    }
}
