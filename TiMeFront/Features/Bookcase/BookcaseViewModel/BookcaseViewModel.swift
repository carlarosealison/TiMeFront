//
//  BookcaseViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 25/09/2025.
//

import Foundation

@MainActor
@Observable
class BookcaseViewModel {
    
<<<<<<< HEAD
    // MARK: - Properties
    private(set) var books: [Book] = []
    private(set) var currentMonth: Int = 1
    private(set) var currentYear: Int = 2025
    
    // MARK: - Computed Properties
    
    /// Nom du mois actuel formaté en français
    var currentMonthName: String {
        DateFormatter.monthName(from: currentMonth)
    }
    
    /// Titre complet (ex: "Janvier 2025")
    var monthYearTitle: String {
        "\(currentMonthName) \(currentYear)"
    }
    
    // MARK: - Initialization
    
    init() {
        setupCurrentMonthAndYear()
        loadBooks()
    }
    
    // MARK: - Private Methods
    
    /// Configure le mois et l'année actuels
    private func setupCurrentMonthAndYear() {
        let calendar = Calendar.current
        let now = Date()
=======
        // MARK: - Types
    
        /// Représente un mois avec ses livres
    struct MonthData: Identifiable {
        let id = UUID()
        let month: Int
        let year: Int
        let books: [Book]
>>>>>>> main
        
        var monthName: String {
            DateFormatter.monthName(from: month)
        }
    }
    
        // MARK: - Properties
    
    private(set) var monthsData: [MonthData] = []
    
        // MARK: - Initialization
    
    init() {
        loadMonths()
    }
    
        // MARK: - Public Methods
    
        /// Recharge les données (utile si besoin de rafraîchir)
    func refresh() {
        loadMonths()
    }
    
        // MARK: - Private Methods
    
        /// Charge les mois à afficher (6 derniers mois par exemple)
    private func loadMonths() {
        let calendar = Calendar.current
        let now = Date()
        
            // Génère les 6 derniers mois
        monthsData = (0..<6).compactMap { monthsAgo in
            guard let date = calendar.date(byAdding: .month, value: -monthsAgo, to: now) else {
                return nil
            }
            
            let month = calendar.component(.month, from: date)
            let year = calendar.component(.year, from: date)
            
            return MonthData(
                month: month,
                year: year,
                books: generateBooksForMonth(month: month, year: year)
            )
        }.reversed() // Du plus ancien au plus récent
    }
    
        /// Génère les livres pour un mois donné
        /// Calcule le nombre de semaines (tranches de 7 jours) dans le mois
    private func generateBooksForMonth(month: Int, year: Int) -> [Book] {
        let calendar = Calendar.current
        
            // Crée la date du 1er jour du mois
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDay = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: firstDay) else {
                // Fallback : 4 livres par défaut
            return (1...4).map { weekNumber in
                Book(weekNumber: weekNumber, month: month, year: year)
            }
        }
        
            // Nombre de jours dans le mois
        let daysInMonth = range.count
        
            // Nombre de tranches de 7 jours + une dernière tranche si reste
        let numberOfBooks = Int(ceil(Double(daysInMonth) / 7.0))
        
            // Génère les livres
        return (1...numberOfBooks).map { weekNumber in
            Book(weekNumber: weekNumber, month: month, year: year)
        }
    }
    
        /// Calcule la première date d'une semaine
        /// Utile pour ton PrivateJournalWeekView
    func firstDateOfWeek(weekNumber: Int, month: Int, year: Int) -> Date? {
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDayOfMonth = calendar.date(from: components) else {
            return nil
        }
        
            // Calcule le premier jour de la semaine
        let firstDayOfWeek = 1 + (weekNumber - 1) * 7
        
        return calendar.date(byAdding: .day, value: firstDayOfWeek - 1, to: firstDayOfMonth)
    }
    
        /// Calcule la dernière date d'une semaine
    func lastDateOfWeek(weekNumber: Int, month: Int, year: Int) -> Date? {
        guard let firstDate = firstDateOfWeek(weekNumber: weekNumber, month: month, year: year) else {
            return nil
        }
        
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 6, to: firstDate)
    }
}
