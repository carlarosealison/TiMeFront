//
//  ComponentViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 01/10/2025.
//

import Foundation

@Observable
class ComponentViewModel {
    var buttonFuncText : String
    
    init(buttonFuncText: String) {
        self.buttonFuncText = buttonFuncText
    }
}
