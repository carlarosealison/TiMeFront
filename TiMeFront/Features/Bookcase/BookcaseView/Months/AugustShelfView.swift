    //
    //  AugustShelfView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 30/10/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct AugustShelfView: View {
    let year: Int
    private let monthNumber = 8
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -110, height: 45),
                rotation: Angle(degrees: 90),
                scale: 0.86
            ),
            BookPlacement(
                offset: CGSize(width: -120, height: 8),
                rotation: Angle(degrees: 90),
                scale: 0.91
            ),
            BookPlacement(
                offset: CGSize(width: 59, height: 46),
                rotation: Angle(degrees: 90),
                scale: 0.8
            ),
            BookPlacement(
                offset: CGSize(width: 44, height: 11),
                rotation: Angle(degrees: 90),
                scale: 0.89
            ),
            BookPlacement(
                offset: CGSize(width: 37, height: -26),
                rotation: Angle(degrees: 90),
                scale: 0.93
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
                Text("Août \(year)")
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
                
                DecorationView(type: .plant3)
                    .scaleEffect(4)
                    .offset(.init(width: 165, height: -88))
                
                ShelfView(width: 450, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: 35, height: 0))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        AugustShelfView(year: 2025)
        .environment(AuthViewModel())
    }
}
