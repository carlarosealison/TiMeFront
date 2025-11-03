import SwiftUI

@available(iOS 26.0, *)
struct MarchShelfView: View {
    let year: Int
    private let monthNumber = 3
    
    private var allBookPlacements: [BookPlacement] {
        [
            BookPlacement(
                offset: CGSize(width: -140, height: 5),
                rotation: Angle(degrees: 0),
                scale: 0.85
            ),
            BookPlacement(
                offset: CGSize(width: -85, height: 8),
                rotation: Angle(degrees: 0),
                scale: 0.9
            ),
            BookPlacement(
                offset: CGSize(width: -38, height: 10),
                rotation: Angle(degrees: 0),
                scale: 0.88
            ),
            BookPlacement(
                offset: CGSize(width: 32, height: 26),
                rotation: Angle(degrees: -40),
                scale: 0.92
            ),
            BookPlacement(
                offset: CGSize(width: 75, height: 69),
                rotation: Angle(degrees: -40),
                scale: 0.87
            ),
            BookPlacement(
                offset: CGSize(width: 100, height: -75),
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
                Text("Mars \(year)")
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
                        BookView(book: book)
                            .offset(book.placement.offset)
                            .rotationEffect(book.placement.rotation)
                            .scaleEffect(book.placement.scale)
                    }
                    .buttonStyle(.plain)
                }
                
                ShelfView(width: 450, height: 15)
                    .allowsHitTesting(false)
                    .offset(.init(width: 70, height: 0))
            }
            .frame(height: 220)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        MarchShelfView(year: 2025)
            .padding()
    }
}
