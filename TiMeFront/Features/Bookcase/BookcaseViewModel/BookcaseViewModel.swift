//
//  BookcaseViewModel.swift
//  TiMeFront
//
//  Created by Thibault on 01/11/2025.
//


import Foundation
import SwiftUI

@MainActor
@Observable
class BookcaseViewModel {
    let currentYear: Int
    
    init() {
        self.currentYear = Calendar.current.component(.year, from: Date())
    }
    
    
    func firstDateOfWeek(weekNumber: Int, month: Int, year: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1 + (weekNumber - 1) * 7
        return Calendar.current.date(from: components)
    }
    
    
    func lastDateOfWeek(weekNumber: Int, month: Int, year: Int) -> Date? {
        guard let firstDate = firstDateOfWeek(weekNumber: weekNumber, month: month, year: year) else {
            return nil
        }
        return Calendar.current.date(byAdding: .day, value: 6, to: firstDate)
    }
    
    // Calcule le nombre de semaines dans le mois pour afficher le bon nombre de livres
    func numberOfWeeks(in month: Int, year: Int) -> Int {
        let calendar = Calendar.current
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1
        
        guard let firstDay = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: firstDay) else {
            return 4 // Fallback sécuritaire
        }
        
        let daysInMonth = range.count
        return Int(ceil(Double(daysInMonth) / 7.0))
    }
}
