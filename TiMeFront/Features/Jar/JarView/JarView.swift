    //
    //  JarView.swift
    //  TiMeFront
    //
    //  Created by Apprenant125 on 26/09/2025.
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
                
                Text("Secoue le téléphone pour découvir le défi du jour")
                    .foregroundStyle(.purpleText)
                    .font(.system(size: 10).width(.expanded).weight(.light))
                
                Spacer(minLength: 520)
            }
        }
    }
}

struct BallsView: View {
    @Binding var navigationPath: NavigationPath
    @State var challengeVM = ChallengeViewModel()
//=======
//    @Environment(ChallengeViewModel.self) var challengeVM
//>>>>>>> main
    @State var navManager = NavigationManager()
    var scene : SKScene {
        let scene = JarViewModelContainer()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.backgroundColor = .whitePurple
        scene.navManager = navManager
        scene.challengeVM = challengeVM
        
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .onShakeGesture {
                print("Device has been shaken!")

            }
            //        .matchedTransitionSource(id: <#T##Hashable#>, in: <#T##Namespace.ID#>)
        
            .onChange(of: navManager.shouldNavigate) { _, shouldNavigate in
                if shouldNavigate {
                    navigationPath = NavigationPath()
                    navigationPath.append(DashboardDestination.challenge)
                    navManager.shouldNavigate = false
                }
            }
    }
}

extension View {
    public func onShakeGesture(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeGestureViewModifier(action: action))
    }
}

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

extension UIWindow{
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        
    }
    
}

struct ShakeGestureViewModifier: ViewModifier {
        // 1
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            // 2
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

#Preview {
    JarView(navigationPath: .constant(NavigationPath()))
}
