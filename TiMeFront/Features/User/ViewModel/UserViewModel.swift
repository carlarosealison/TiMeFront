//
//  UserViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

@Observable
class UserViewModel{
    var users: [User] = []
    let userRepo = UserRepo()
    
    func createUser(firstName: String, lastName: String, userName: String, email: String, password: String, confirmPassword: String )async throws{
        do{
            let newUser = try await userRepo.creatUser(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password)
            users.append(newUser)
        }catch{
            print("erreur de saisie \(error)")
        }
    }
}
