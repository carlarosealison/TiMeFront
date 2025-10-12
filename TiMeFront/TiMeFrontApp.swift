//
//  TiMeFrontApp.swift
//  TiMeFront
//
//  Created by Apprenant125 on 12/09/2025.
//

import SwiftUI
import CoreMotion

@main
struct TiMeFrontApp: App {
    var body: some Scene {
        WindowGroup {
            //JarView(viewModel: BallsViewModel(motionManager: CMMotionManager()))
            ChallengeView()
            
            //AuthentificationView()
        }
    }
}
