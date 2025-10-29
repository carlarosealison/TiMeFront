//
//  StatRepo.swift
//  TiMeFront
//
//  Created by apprenant152 on 28/10/2025.
//

import Foundation

struct StatRepo {
    
    var statService: StatService
    let statMapper = StatMapper()
    
    func getCountPage() async throws -> StatModel {
        let statDTO = try await statService.getCountPage()
        return statMapper.map(dto: statDTO)
    }
    
    func getCountNote() async throws -> StatModel {
        let statDTO = try await statService.getCountNote()
        return statMapper.map(dto: statDTO)
    }
    
    func getAverageMotivation() async throws -> StatModel {
        let statDTO = try await statService.getAverageMotivation()
        return statMapper.map(dto: statDTO)
    }
}

