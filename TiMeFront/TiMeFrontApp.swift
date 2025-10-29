//
//  TiMeFrontApp.swift
//  TiMeFront
//
//  Created by Apprenant125 on 12/09/2025.
////
//
import SwiftUI
import CoreMotion

@available(iOS 26.0, *)
@main
struct TiMeFrontApp: App {
    
    @State private var authVM = AuthViewModel()
    @State private var userVM = UserViewModel()  // ← Ajoute ceci
    var body: some Scene {
        WindowGroup {

                ContentView()
                .environment(authVM)
                .environment(userVM)
            }
        }
    }
