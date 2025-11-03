    //
    //  Book.swift
    //  TiMeFront
    //

import Foundation
import SwiftUI

    /// Représente un livre dans la bibliothèque (correspond à une semaine)
struct Book: Identifiable {
    let id = UUID()
    let weekNumber: Int
    let month: Int
    let year: Int
    let placement: BookPlacement
    
        /// Titre formaté du livre
    var title: String {
        let monthName = DateFormatter.monthName(from: month)
        return "Semaine \(weekNumber) - \(monthName) \(year)"
    }
    
        /// Couleur du livre calculée automatiquement
    var color: BookColor {
        let colors: [BookColor] = [.purple, .pink, .purpleDark, .gray]
        let monthOffset = month % colors.count
        let colorIndex = (weekNumber - 1 + monthOffset) % colors.count
        return colors[colorIndex]
    }
}

    // MARK: - Book Placement

    /// Définit la position, rotation et taille d'un livre sur l'étagère
struct BookPlacement {
    var offset: CGSize
    var rotation: Angle
    var scale: CGFloat
    
    static let `default` = BookPlacement(
        offset: .zero,
        rotation: .zero,
        scale: 1.0
    )
}

    // MARK: - DateFormatter Extension

extension DateFormatter {
    static func monthName(from month: Int) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "MMMM"
        
        var components = DateComponents()
        components.month = month
        let date = Calendar.current.date(from: components) ?? Date()
        
        let name = formatter.string(from: date)
        return name.prefix(1).uppercased() + name.dropFirst()
    }
}
