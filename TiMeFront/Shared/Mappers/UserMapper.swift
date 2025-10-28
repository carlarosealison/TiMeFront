//
//  UserMapper.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 29/09/2025.
//

import Foundation

struct UserMapper{
    func mapToUserRequest(_ register: UserForm) -> UserRequest{
        UserRequest(
            firstName: register.firstName,
            lastName: register.lastName,
            userName: register.userName,
            email: register.email,
            password: register.password,
            imageProfil: register.imageProfil)
    }
    
    func mapToUserLogin(_ register: UserAuth) -> UserLogin{
        UserLogin(
            email: register.email,
            password: register.password)
    }
    

}
func mapUserResponse(_ dto: UserResponse) -> User {
    User(
        firstName: dto.firstName,
        lastName: dto.lastName,
        userName: dto.userName,
        email: dto.email,
        password: "",
        streakNumber: 0,
        role: "user",
        challengeNumber: 0
    )
}

