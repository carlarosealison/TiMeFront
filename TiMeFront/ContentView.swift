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
    @State private var viewModel = JournalEditorViewModel(user: AuthViewModel())
    @State private var challengeVM = ChallengeViewModel()
    
    var body: some View {
        Group {
              if authVM.isAuthenticated {
                  DashboardView()
              } else {
                  AuthentificationView()
              }
          }
//        .environment(journalEditVM)
        .environment(challengeVM)
        .animation(.easeInOut, value: authVM.isAuthenticated)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ContentView()
                .environment(AuthViewModel())
                .environment(ChallengeViewModel())
    }
}
