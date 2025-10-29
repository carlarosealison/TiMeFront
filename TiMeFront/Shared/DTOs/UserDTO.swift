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
    var imageProfil: String?
    var streakNumber: Int
}

