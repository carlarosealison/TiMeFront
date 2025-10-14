//
//  UserRepo.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

class UserRepo{
    
    private let service = UserService()
    private let mapper = UserMapper()
    
    func creatUser(firstName: String, lastName: String, userName: String, email: String, password: String, imageProfil: String) async throws -> UserResponse{
        let request = UserRequest(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password, imageProfil: imageProfil)
        return try await service.createUser(user: request)

    }
    
    func login(email: String, password: String)async throws -> String{
        let request = UserLogin(email: email, password: password)
        return try await service.login(user: request)
    }
}
//        return mapper.mapUserResponse(response)
