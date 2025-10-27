//
//  PageModel.swift
//  TiMeFront
//
//  Created by Thibault on 19/10/2025.
//

import Foundation

//MARK: - PageModel
struct PageModel: Identifiable {
    let id: UUID
    let note: String
    let createdAt: Date
    let idUser: UUID
}
