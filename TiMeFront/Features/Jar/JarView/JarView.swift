//
//  JarView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import SwiftUI
import SpriteKit
import CoreMotion

struct JarView: View {
    
    @ObservedObject var viewModel : BallsViewModel
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {

                Color.whitePurple
                    .ignoresSafeArea()
                
                BallsView()

                VStack {
    
                    Spacer()
                    
                    Text("Met toi au défi dès aujourd'hui")
                        .foregroundStyle(.purpleDark)
                        .font(.system(size: 16).width(.expanded).weight(.medium))
                        .padding(.bottom, 5)
                    
                    Text("Secoue le téléphone pour découvir le défi du jour")
                        .foregroundStyle(.purpleText)
                        .font(.system(size: 10).width(.expanded).weight(.light))
                    
                    Spacer(minLength: 520)
                }
            }
        }
    }
}


struct BallsView: View {
    var scene : SKScene {
        let scene = BallsViewContainer()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.backgroundColor = .whitePurple
        
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

//#Preview {
//    BallsView()
//}

#Preview {
    
    @Previewable
    @State var viewModel = BallsViewModel(motionManager: CMMotionManager())
    
    JarView(viewModel: BallsViewModel(motionManager: CMMotionManager()))
}


