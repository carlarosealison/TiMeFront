//
//  UserDTO.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct UserRequest: Codable{
    var firstName: String
    var lastName: String
    var userName: String
    var email: String
    var password: String
    var imageProfil: String?
}

struct UserStreakDTO: Codable{
    var streak: Int
}

struct UserLogin: Codable{
    var email: String?
    var username: String?
    var password: String
}

struct UserResponse: Decodable{
    let id: UUID?
    let firstName: String
    let lastName: String
    var userName: String
    let email: String
    let streakNumber: Int
    let challengeNumber: Int
    var imageProfil: String?
}
