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
            }else{
                VStack(spacing: 80){
                    Image(systemName: "lock.fill")
                        .resizable()
                        .foregroundStyle(.purpleButton)
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                    Text("Non authentifier")
                        .mediumBlack()
                }
          
            }
        }
}

#Preview {
    let authVM = AuthViewModel()
    StreakView()
        .environment(authVM)
}
