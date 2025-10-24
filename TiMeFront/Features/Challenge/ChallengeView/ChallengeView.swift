//
//  ChallengeView.swift
//  TiMeFront
//
//  Created by Carla on 25/09/2025.
//

import SwiftUI

struct ChallengeView: View {
    @Binding var navigationPath: NavigationPath
    @State var viewModel = ChallengeOfTheDayViewModel(authViewModel: AuthViewModel())
    
    @State private var isValidated = false
    @State private var showSuccessAnimation = false
    
    var body: some View {
        ZStack {
            // Background qui passe au vert lors de la validation
            (showSuccessAnimation ? Color.greenCustom : Color.whitePurple)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: showSuccessAnimation)
            
            if !showSuccessAnimation {
                VStack(spacing: 40) {
                    Spacer(minLength: 200)
                    
                    Text("Défi du jour")
                        .mediumPurple()
                        .padding(5)
                    
                    Text(viewModel.challenge?.instruction ?? "challenge indisponible")
                        .semiBold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    SlideToValidate(isValidated: $isValidated) {
                        handleValidation()
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
            } else {
                // Animation de succès
                VStack(spacing: 30) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                        .scaleEffect(showSuccessAnimation ? 1.0 : 0.5)
                        .opacity(showSuccessAnimation ? 1.0 : 0.0)
                    
                    Text("Challenge validé!")
                        .font(.system(size: 32, weight: .bold).width(.expanded))
                        .foregroundStyle(.white)
                        .opacity(showSuccessAnimation ? 1.0 : 0.0)
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Ignorer") {
                    navigationPath = NavigationPath()
                }
                .foregroundStyle(showSuccessAnimation ? .white : .purpleText)
                .fontWeight(.regular)
                .fontWidth(.expanded)
                .underline()
            }
        }
        .task {
            do {
                try await viewModel.fetchRandomChallengeOfTheDay()
            } catch {
                print("Error while fetching the challenge : \(error.localizedDescription)")
            }
        }
        .onChange(of: isValidated) { _, validated in
            if validated {
                handleValidation()
            }
        }
    }
    
    private func handleValidation() {
        // Animation de succès
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            showSuccessAnimation = true
        }
//isChallengeCompleted = true
        
        // Attendre 1.5 secondes puis retourner au Dashboard
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            navigationPath = NavigationPath()
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    
    NavigationStack(path: $path) {
        ChallengeView(navigationPath: $path)
    }
}
