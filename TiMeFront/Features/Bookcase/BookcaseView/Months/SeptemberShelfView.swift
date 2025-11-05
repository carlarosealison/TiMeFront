    //
    //  SeptemberShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct SeptemberShelfView: View {
    let year: Int
    private let monthNumber = 9
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -135, height: 18),
                rotation: Angle(degrees: 0),
                scale: 0.75
            ),
            BookPlacement(
                offset: CGSize(width: -95, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: -55, height: 6),
                rotation: Angle(degrees: 0),
                scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: -10, height: 8),
                rotation: Angle(degrees: 0),
                scale: 0.9
            ),
            BookPlacement(
                offset: CGSize(width: 38, height: 0),
                rotation: Angle(degrees: 0),
                scale: 0.95
            ),
            BookPlacement(
                offset: CGSize(width: -60, height: -70),
                rotation: Angle(degrees: 0),
                scale: 0.77
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
                Text("Septembre \(year)")
                    .font(.system(size: 18, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 50)
            
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
                
                DecorationView(type: .plant2)
                    .scaleEffect(4)
                    .offset(.init(width: 155, height: -80))
                
                ShelfView(width: 450, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: 50, height: -15))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        SeptemberShelfView(year: 2025)
        .environment(AuthViewModel())
    }
}
