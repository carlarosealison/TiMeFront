//
//  StatModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 26/10/2025.
//

import Foundation

struct StatModel: Identifiable{
    
    let id = UUID()
    var nbAtelierCompleted: Int
    var nbPage: Int
    var nbBookCompleted: Int
    var nbWriting: Int
    var averageMotivation: Double
}
