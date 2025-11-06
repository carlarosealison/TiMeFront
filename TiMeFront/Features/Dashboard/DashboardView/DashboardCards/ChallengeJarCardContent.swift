//
//  DashboradBocalView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 12/10/2025.
//

import SwiftUI
import SpriteKit

struct ChallengeJarCardContent: View {
    var body: some View {
        MiniBallsView()
    }
}
struct MiniBallsView : View {
    var scene : SKScene{
        
        let scene = BallsDashboardViewContainer()
        scene.size = CGSize(width: 300, height: 300)
        scene.backgroundColor = .whitePurple
        
        return scene
    }
    var body: some View{
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

#Preview {
    DashboardCard {
        ChallengeJarCardContent()

    }.frame(width: 300, height: 300)
}
