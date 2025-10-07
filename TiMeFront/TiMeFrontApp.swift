//
//  TiMeFrontApp.swift
//  TiMeFront
//
//  Created by Apprenant125 on 12/09/2025.
//

import SwiftUI

@main
struct TiMeFrontApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            AuthentificationView()
        }
    }
}
