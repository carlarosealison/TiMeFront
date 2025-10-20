//
//  Week.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import Foundation

/// Représente une semaine complète avec 7 jours (ou moins pour la dernière semaine du mois)
struct Week: Identifiable {
    let id = UUID()
    let weekNumber: Int
    let month: Int
    let year: Int
    let days: [DayEntry]  // 7 jours max (peut être moins pour la dernière semaine)
    
    /// Génère les dates d'une "semaine" (tranche de 7 jours depuis le début du mois)
    /// weekNumber = 1 → jours 1-7
    /// weekNumber = 2 → jours 8-14
    /// weekNumber = 5 → jours 29-31 (si le mois a 31 jours)
    static func generateWeekDates(weekNumber: Int, month: Int, year: Int) -> [Date] {
        let calendar = Calendar.current
        
        // Premier jour du mois
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDayOfMonth = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth) else {
            return []
        }
        
        let daysInMonth = range.count
        
        // Calcul du premier jour de cette "semaine"
        let startDay = (weekNumber - 1) * 7 + 1
        
        // Calcul du dernier jour de cette "semaine" (max 7 jours)
        let endDay = min(startDay + 6, daysInMonth)
        
        // Génère les dates
        var dates: [Date] = []
        for day in startDay...endDay {
            var dayComponents = DateComponents()
            dayComponents.year = year
            dayComponents.month = month
            dayComponents.day = day
            
            if let date = calendar.date(from: dayComponents) {
                dates.append(date)
            }
        }
        
        return dates
    }
}

// Ajoute cette extension dans Week.swift
extension Week {
    /// Charge une semaine complète depuis l'API (1 seul appel !)
    static func load(
        weekNumber: Int,
        month: Int,
        year: Int,
        userId: String,
        apiService: APIService
    ) async throws -> Week {
        
        // Génère les dates de la semaine
        let dates = generateWeekDates(weekNumber: weekNumber, month: month, year: year)
        
        // Charge toutes les données en 1 appel
        var dayEntries: [DayEntry] = []
        
        for date in dates {
            let formatter = ISO8601DateFormatter()
            let dateString = formatter.string(from: date)
            
            do {
                // Utilise le nouveau endpoint qui retourne DayDataResponseDTO
                let dayDTO: DayDataResponseDTO = try await apiService.get(
                    endpoint: "day/\(userId)/\(dateString)",
                    as: DayDataResponseDTO.self
                )
                
                dayEntries.append(DayEntry(from: dayDTO))
                
            } catch {
                // Jour vide si erreur
                dayEntries.append(DayEntry(date: date))
            }
        }
        
        return Week(
            weekNumber: weekNumber,
            month: month,
            year: year,
            days: dayEntries
        )
    }
}

// Extension Array pour accès sécurisé
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
