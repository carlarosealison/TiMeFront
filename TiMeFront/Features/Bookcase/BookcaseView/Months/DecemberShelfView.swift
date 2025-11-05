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
                offset: CGSize(width: -114, height: 43),
                rotation: Angle(degrees: 90),
                scale: 0.98
            ),
            BookPlacement(
                offset: CGSize(width: -110, height: 3),
                rotation: Angle(degrees: 90),
                scale: 0.96
            ),
            BookPlacement(
                offset: CGSize(width: -100, height: -37),
                rotation: Angle(degrees: 90),
                scale: 0.94
            ),
            BookPlacement(
                offset: CGSize(width: 9, height: -5),
                rotation: Angle(degrees: -25),
                scale: 0.92
            ),
            BookPlacement(
                offset: CGSize(width: 52, height: -4),
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
                        BookView(book: book, showInitials: true)
                    }
                    .buttonStyle(.plain)
                    .offset(book.placement.offset)
                }
                
                DecorationView(type: .cactus)
                    .scaleEffect(1.6)
                    .offset(.init(width: 150, height: -45))
                
                ShelfView(width: 420, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: 0, height: -15))
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
        .environment(AuthViewModel())
    }
}
