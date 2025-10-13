//
//  User.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct User: Identifiable{
    let id = UUID()
    var firstName: String
    var lastName: String
    var userName: String
    var email: String
    var password: String
    var streakNumber: Int
    var role: String
    var challengeNumber: Int
    var imageProfil: String?
}
