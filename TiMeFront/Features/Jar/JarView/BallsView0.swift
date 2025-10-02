//
//  BallsView.swift
//  TiMeFront
//
//  Created by Apprenant125 on 29/09/2025.
//

import SpriteKit
import SwiftUI
import CoreMotion



class BallsView0 : SKScene{
    //mise en place de la gravité sur la vue
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
    }
    
    //création du sprite
    override func sceneDidLoad() {
        let circle = SKSpriteNode()
        circle.size = CGSize(width: 10, height: 10)
        
        //mise en place des propriétés physiques
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 75)
        
        // comment le srpite est affecté par la gravité
        circle.physicsBody?.isDynamic = true
        circle.physicsBody?.affectedByGravity = true
        
        //ajout de la vue
        addChild(circle)
    }
}

struct BallsView1 : View {

    @StateObject var viewModel = BallsViewModel(motionManager: CMMotionManager())
    
    var body: some View {
        


        ZStack {
            Circle() //bordure de la ball
                .stroke(.gray,lineWidth: 2)
                .frame(width: viewModel.circleRadius * 2, height: viewModel.circleRadius * 2)
            
            Circle()// ball
                .foregroundStyle(.gray.mix(with: .white, by: 0.6))
                .frame(width: 75)
                .shadow(radius: 3, y: 4)
                .offset(x: viewModel.ballPosition.x, y: viewModel.ballPosition.y)
        }.onAppear {
            viewModel.startMotionUpdates()
        }
        .onDisappear {
            viewModel.motionManager.stopDeviceMotionUpdates()
        }

    }
}

#Preview {
    BallsView1()
}
