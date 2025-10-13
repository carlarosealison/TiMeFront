//
//  ContentView.swift
//  TiMeFront
//
//  Created by apprenant152 on 13/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct ContentView: View {
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        Group {
              if authVM.isAuthenticated {
                  DashboardView() // 🔒 partie protégée
              } else {
                  AuthentificationView() // 🔑 login
              }
          }
          .animation(.easeInOut, value: authVM.isAuthenticated)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ContentView()
                .environment(AuthViewModel())
    } else {
        // Fallback on earlier versions
    }
}
