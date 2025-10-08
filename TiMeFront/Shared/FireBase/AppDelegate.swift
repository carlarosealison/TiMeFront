//
//  FirebaseConfig.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 07/10/2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()
      
      if FirebaseApp.app() == nil{
          print("Firebase n'est pas configuré !")
      }else{
          print("FireBase est configuré !")
      }
      
    return true
      
  }
}
