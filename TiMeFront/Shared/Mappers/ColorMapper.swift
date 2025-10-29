//
//  ColorMapper.swift
//  TiMeFront
//
//  Created by Thibault on 20/10/2025.
//

import SwiftUI

struct ColorMapper {
    /// Convertit un nom de couleur du backend vers une couleur Asset
    /// Backend : "Violet", "Vert", "Rose", "Bleu", "Rouge", "Orange", "Gris"
    /// Assets : "PurpleButton", "GreenCustom", "PinkCustomClear", etc.
    static func color(from name: String) -> Color {
        switch name.lowercased() {
        case "violet":
            return Color("PurpleButton")
        case "vert":
            return Color("GreenCustom")
        case "rose":
            return Color("PinkCustomClear")
        case "bleu":
            return Color("BlueCustom")
        case "rouge":
            return Color("RedCustom")
        case "orange":
            return Color("OrangeCustomCard")
        case "gris":
            return Color("GrayCustom")
        default:
            return Color("WhitePurple")
        }
    }
}
