//
//  PopOverCategoryEmotion.swift
//  TiMeFront
//
//  Created by Sebastien Besse on 19/10/2025.
//

import SwiftUI

struct PopOverCategoryEmotion: View {
    @State private var isShowingPopover = false
    
    let tabCatégory = ["🤓 heureux", "🤓 heureux"]
    var body: some View {
        ZStack{
            Color.red
            Button {
                self.isShowingPopover = true
            } label: {
                Image(systemName: "info.circle")
                    .foregroundStyle(.black)
            }
            
            if isShowingPopover{
                VStack{
                   
                }
            }
        }
    }
}
    
    #Preview {
        PopOverCategoryEmotion()
    }
