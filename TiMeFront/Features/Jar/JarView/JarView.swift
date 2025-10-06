//
//  JarView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import SwiftUI
import SpriteKit

struct JarView: View {
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
                
                
                //            Circle()
                //                .frame(width: 75)
                //                .foregroundStyle(.gray.mix(with: .white, by: 0.6))
                //                .shadow(radius: 3, y: 4)
                
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DissmissButton()
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

#Preview {
    BallsView()
}

#Preview {
    JarView()
    
}
