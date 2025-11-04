    //
    //  MayShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct MayShelfView: View {
    let year: Int
    private let monthNumber = 5
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -160, height: 1),
                rotation: Angle(degrees: 0),
                scale: 1
            ),
            BookPlacement(
                offset: CGSize(width: -120, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.9
            ),
            BookPlacement(
                offset: CGSize(width: -36, height: 46),
                rotation: Angle(degrees: 90),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: -41, height: 13),
                rotation: Angle(degrees: 90),
                scale: 0.78
            ),
            BookPlacement(
                offset: CGSize(width: 38, height: -3),
                rotation: Angle(degrees: -30),
                scale: 0.92
            ),
            BookPlacement(
                offset: CGSize(width: -30, height: -70),
                rotation: Angle(degrees: 90),
                scale: 0.8
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
                Text("Mai \(year)")
                    .font(.system(size: 18, weight: .bold))
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("PurpleDark"))
                Spacer()
            }
            .padding(.horizontal, 90)
            
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
                
                ShelfView(width: 550, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: 0, height: -15))
                
                DecorationView(type: .plant4)
                    .scaleEffect(2.8)
                    .offset(.init(width: 160, height: -3))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        MayShelfView(year: 2025)
        .environment(AuthViewModel())
    }
}
