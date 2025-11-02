    //
    //  StreakView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 29/10/2025.
    //

import SwiftUI

struct StreakView: View {
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
            if let user = authVM.currentUser {
                VStack {
                    Image("StreakSmall")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .padding()
                    
                    Text("Jour \(user.streakNumber)")
                        .semiBoldPurpleTitle()
                        .foregroundStyle(Color("PurpleDark"))
                }
            }
        }
}

#Preview {
    let authVM = AuthViewModel()
//    authVM.currentUser = UserResponse(
//        id: UUID(),
//        firstName: "Thibault",
//        lastName: "Test",
//        userName: "thibault",
//        email: "test@test.com",
//        imageProfil: nil,
//        streakNumber: 12,
//        challengeNumber: 6
//    )
    
    StreakView()
        .environment(authVM)
}
