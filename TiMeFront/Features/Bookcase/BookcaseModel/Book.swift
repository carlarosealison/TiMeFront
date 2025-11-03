    //
    //  Book.swift
    //  TiMeFront
    //
    //  Created by Thibault on 15/10/2025.
    //

import Foundation
import SwiftUI

    /// Représente un livre dans la bibliothèque (correspond à une semaine)
struct Book: Identifiable {
    let id = UUID()
    let weekNumber: Int  // 1 à 4 (ou 5)
    let month: Int       // 1 à 12
    let year: Int        // 2025, 2026...
    
        /// Titre formaté du livre (ex: "Semaine 2 - Janvier 2025")
    var title: String {
        let monthName = DateFormatter.monthName(from: month)
        return "Semaine \(weekNumber) - \(monthName) \(year)"
    }
    
        /// ✅ Couleur du livre calculée automatiquement
    var color: BookColor {
            // Rotation des couleurs selon weekNumber + variation par mois
        let colors: [BookColor] = [
            .purple,
            .pink,
            .orange,
            .yellow,
            .purpleDark,
            .gray
        ]
        
            // Offset selon le mois pour varier les étagères
        let monthOffset = month % colors.count
        let colorIndex = (weekNumber - 1 + monthOffset) % colors.count
        
        return colors[colorIndex]
    }
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
