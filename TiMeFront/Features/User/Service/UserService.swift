//
//  UserService.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct UserService{
    
    private let api = APIService()
    
    func createUser(user: UserRequest)async throws->UserResponse{
       try await api.post(endpoint: "", body: user)
    }
//    func getIdUser(id: String, user: UserResponse)async throws->UserResponse{
//        try await api.get(endpoint: "users/\(id)", as: user.self)
//    }
}
