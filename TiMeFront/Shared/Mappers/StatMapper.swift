//
//  StatMapper.swift
//  TiMeFront
//
//  Created by apprenant152 on 28/10/2025.
//

import Foundation

struct StatMapper{
    
    func map(dto: StatDTO)->StatModel{
        StatModel(countData: dto.count)
    }
    
}

