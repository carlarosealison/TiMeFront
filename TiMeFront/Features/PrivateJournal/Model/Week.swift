//
//  Week.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import Foundation

/// Représente une semaine complète avec 7 jours
struct Week: Identifiable {
    let id = UUID()
    let weekNumber: Int
    let month: Int
    let year: Int
    let days: [DayEntry]  // 7 jours (lundi → dimanche)
    
    /// Calcule la date de début de semaine (lundi)
    static func calculateStartDate(weekNumber: Int, month: Int, year: Int) -> Date? {
        let calendar = Calendar.current
        
        // 1. Premier jour du mois
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDayOfMonth = calendar.date(from: components) else {
            return nil
        }
        
        // 2. Trouver le premier lundi du mois
        var currentDate = firstDayOfMonth
        while calendar.component(.weekday, from: currentDate) != 2 {  // 2 = lundi
            guard let nextDay = calendar.date(byAdding: .day, value: 1, to: currentDate) else {
                return nil
            }
            currentDate = nextDay
        }
        
        // 3. Ajouter les semaines pour arriver à la bonne semaine
        return calendar.date(byAdding: .weekOfYear, value: weekNumber - 1, to: currentDate)
    }
    
    /// Génère les 7 dates d'une semaine (lundi à dimanche)
    static func generateWeekDates(weekNumber: Int, month: Int, year: Int) -> [Date] {
        guard let weekStartDate = calculateStartDate(weekNumber: weekNumber, month: month, year: year) else {
            return []
        }
        
        let calendar = Calendar.current
        return (0..<7).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: weekStartDate)
        }
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
