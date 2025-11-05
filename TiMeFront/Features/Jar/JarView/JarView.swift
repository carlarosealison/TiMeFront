    //
    //  JarView.swift
    //  TiMeFront
    //
    //  Created by Carla on 26/09/2025.
    //

import SwiftUI
import SpriteKit
import CoreMotion

struct JarView: View {
    @Binding var navigationPath: NavigationPath
    @Namespace private var transitionNamespace

    var body: some View {
        ZStack {
            Color.whitePurple
                .ignoresSafeArea()
            
            BallsView(navigationPath: $navigationPath)
            
            VStack {
                Spacer()
                
                Text("Met toi au défi dès aujourd'hui")
                    .foregroundStyle(.purpleDark)
                    .font(.system(size: 16).width(.expanded).weight(.medium))
                    .padding(.bottom, 5)
                
                Text("Secoue le téléphone pour découvrir le défi du jour")
                    .foregroundStyle(.purpleText)
                    .font(.system(size: 10).width(.expanded).weight(.light))
                
                Spacer(minLength: 520)
            }
        }
    }
}

struct BallsView: View {
    @Binding var navigationPath: NavigationPath
    
    @Environment(ChallengeViewModel.self) var challengeVM
    @Environment(AuthViewModel.self) var authVM
    
    @State var navManager = NavigationManager()
    @State private var skScene: JarViewModelContainer?
    @State private var isFetchingChallenge = false
    
    var body: some View {
        Group {
            if let scene = skScene {
                SpriteView(scene: scene)
                    .ignoresSafeArea()
                    .onShakeGesture {
                        handleShake()
                    }
                    .onChange(of: navManager.shouldNavigate) { _, shouldNavigate in
                        if shouldNavigate {
                            handleButtonTap()
                        }
                    }
            } else {
                Color.whitePurple
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            if skScene == nil {
                challengeVM.authViewModel = authVM
                
                let scene = JarViewModelContainer()
                scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                scene.backgroundColor = .whitePurple
                scene.navManager = navManager
                
                skScene = scene
                
                print("✅ [Setup] Scene créée avec authViewModel injecté")
            }
        }
    }
    
    private func handleButtonTap() {
        guard !isFetchingChallenge else {
            print("⚠️ [UI] Fetch déjà en cours, ignoré")
            navManager.shouldNavigate = false
            return
        }
        
        print("🎲 [UI] Bouton cliqué, création du challenge...")
        isFetchingChallenge = true
        
        Task {
            await challengeVM.fetchRandomChallenge()
            
            print("🔍 [UI] Après fetch:")
            print("   Challenge existe: \(challengeVM.challenge != nil)")
            print("   Instruction: \(challengeVM.challenge?.instruction ?? "nil")")
            
            isFetchingChallenge = false
            
            if challengeVM.challenge != nil {
                print("✅ [UI] Challenge prêt, navigation...")
                navigationPath = NavigationPath()
                navigationPath.append(DashboardDestination.challenge)
            } else {
                print("❌ [UI] Challenge non créé, pas de navigation")
            }
            
            navManager.shouldNavigate = false
        }
    }
    
    private func handleShake() {
        guard !isFetchingChallenge else {
            print("⚠️ [UI] Fetch déjà en cours, ignoré")
            return
        }
        
        print("🎲 [UI] Shake détecté, création du challenge...")
        isFetchingChallenge = true
        
        Task {
            await challengeVM.fetchRandomChallenge()
            
            print("🔍 [UI] Après fetch:")
            print("   Challenge existe: \(challengeVM.challenge != nil)")
            print("   Instruction: \(challengeVM.challenge?.instruction ?? "nil")")
            
            isFetchingChallenge = false
            
            if challengeVM.challenge != nil {
                print("✅ [UI] Challenge prêt, navigation...")
                navigationPath = NavigationPath()
                navigationPath.append(DashboardDestination.challenge)
            }
        }
    }
}

    // MARK: - Shake Gesture Extensions

extension View {
    public func onShakeGesture(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeGestureViewModifier(action: action))
    }
}

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
    }
}

struct ShakeGestureViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

    // MARK: - Preview

#Preview {
    JarView(navigationPath: .constant(NavigationPath()))
        .environment(ChallengeViewModel())
        .environment(AuthViewModel())
}
