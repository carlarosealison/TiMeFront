//
//  DayDataModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - DayDataModel
/// Modèle qui regroupe toutes les données d'un jour pour l'affichage
/// Pratique pour les vues qui affichent un jour complet
struct DayDataModel: Identifiable {
    let id = UUID()
    let date: Date
    let emotion: EmotionWithDetailsModel?
    let heartLevel: HeartLevelModel?
    let motivation: MotivationModel?
    let page: PageModel?
    
    /// Indique si ce jour contient au moins une donnée
    var hasData: Bool {
        emotion != nil || heartLevel != nil || motivation != nil || page != nil
    }
}
