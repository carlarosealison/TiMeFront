//
//  TiMeFrontApp.swift
//  TiMeFront
//
//  Created by Apprenant125 on 12/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
@main
struct TiMeFrontApp: App {
    
//    @State private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
//            if authManager.isAuthenticated {
                DashboardView()
//                    .environment(authManager)
//            } else {
//                AuthentificationView()
//                    .environment(authManager)
//            }
        }
    }
}
