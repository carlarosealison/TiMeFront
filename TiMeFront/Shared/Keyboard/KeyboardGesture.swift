//
//  KeyboardGesture.swift
//  TiMeFront
//
//  Created by apprenant152 on 06/11/2025.
//


import SwiftUI
import UIKit

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
#endif
