//
//  BiometricAuthService.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import Foundation
import LocalAuthentication

final class BiometricAuthService {
    static let shared = BiometricAuthService()
    
    private init() {}
    
    func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        context.localizedCancelTitle = "Annuler"
        
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Nous avons besoin de confirmer votre identité."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evalError in
                DispatchQueue.main.async {
                    completion(success, evalError)
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(false, error)
            }
        }
    }
}
