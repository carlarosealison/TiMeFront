//
//  BookcaseViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 25/09/2025.
//

import Foundation

@MainActor
class BookcaseViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published private(set) var books: [Book] = []
    @Published private(set) var currentMonth: Int = 1
    @Published private(set) var currentYear: Int = 2025
    
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
        
        currentMonth = calendar.component(.month, from: now)
        currentYear = calendar.component(.year, from: now)
    }
    
    /// Charge les 4 livres du mois actuel
    private func loadBooks() {
        // Génère 4 livres (semaines) pour le mois actuel
        books = (1...4).map { weekNumber in
            Book(
                weekNumber: weekNumber,
                month: currentMonth,
                year: currentYear
            )
        }
    }
    
    // MARK: - Public Methods
    
    /// Change le mois affiché (pour navigation mois précédent/suivant si besoin plus tard)
    func changeMonth(to month: Int, year: Int) {
        currentMonth = month
        currentYear = year
        loadBooks()
    }
    
    /// Récupère un livre spécifique par son numéro de semaine
    func book(for weekNumber: Int) -> Book? {
        books.first { $0.weekNumber == weekNumber }
    }
}
