//
//  DayEntry.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import Foundation

/// Représente les données d'un jour dans le journal
struct DayEntry: Identifiable {
    let id = UUID()
    let date: Date
    
    // Données du jour (optionnelles car peuvent ne pas exister)
    let emotionTitle: String?
    let emotionColor: String?
    let heartLevel: Int?
    let motivationLevel: Int?
    let note: String?
    
    /// Vérifie si ce jour a des données enregistrées
    var hasData: Bool {
        emotionTitle != nil || 
        heartLevel != nil || 
        motivationLevel != nil || 
        note != nil
    }
    
    /// Init vide pour un jour sans données
    init(date: Date) {
        self.date = date
        self.emotionTitle = nil
        self.emotionColor = nil
        self.heartLevel = nil
        self.motivationLevel = nil
        self.note = nil
    }
    
    /// Init avec données
    init(
        date: Date,
        emotionTitle: String?,
        emotionColor: String?,
        heartLevel: Int?,
        motivationLevel: Int?,
        note: String?
    ) {
        self.date = date
        self.emotionTitle = emotionTitle
        self.emotionColor = emotionColor
        self.heartLevel = heartLevel
        self.motivationLevel = motivationLevel
        self.note = note
    }
    
    init(from dto: DayDataResponseDTO) {
        self.date = dto.date
        
        // Map les données
        self.emotionTitle = dto.emotion?.emotionTitle
        self.emotionColor = dto.emotion?.emotionColor
        self.heartLevel = dto.heartLevel?.level
        self.motivationLevel = dto.motivation?.motivation
        self.note = dto.page?.note
    }
}

// MARK: - Formatage de la date

extension Date {
    /// Formate une date en français (ex: "Lundi 12 Juillet")
    func formattedFrench() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "EEEE dd MMMM"
        
        let formatted = formatter.string(from: self)
        return formatted.prefix(1).uppercased() + formatted.dropFirst()
    }
}
