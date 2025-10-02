//
//  UserViewModel.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

@MainActor
@Observable
class UserViewModel{
    
  var firstName: String = ""
  var lastName: String = ""
  var userName: String = ""
  var email: String = ""
  var password: String = ""
  var confirmPassword: String = ""
    
    var users: [User] = []
    let userRepo = UserRepo()
    
    
    func createUser(firstName: String, lastName: String, userName: String, email: String, password: String)async throws{
        do{
            let newUser = try await userRepo.creatUser(firstName: firstName, lastName: lastName, userName: userName, email: email, password: password)
            users.append(newUser)
        }catch{
            print("erreur de saisie \(error)")
        }
    }
}
