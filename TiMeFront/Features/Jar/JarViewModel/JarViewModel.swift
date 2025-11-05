//
//  JarViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import SpriteKit
import CoreMotion
import UIKit
import SwiftUI

class JarViewModelContainer : SKScene , Observable{
    
    
    let motionManager = CMMotionManager()
    let circleButton = SKShapeNode(circleOfRadius: 65)
    var navManager : NavigationManager?
    var challengeVM: ChallengeViewModel?
    
    @Namespace private var transitionNamespaces
    
    override func didMove(to view: SKView) {
        
        // pour déterminer la frame à ne pas dépasser
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //création du sprite
        let circle = SKShapeNode(circleOfRadius: 40)
        circle.fillColor = .purpleDark
        circle.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 40)
        
        
        //création du sprite 2
        let circle2 = SKShapeNode(circleOfRadius: 40)
        circle2.fillColor = .purpleHover
        circle2.position = CGPoint(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 50)
        
        //création du sprite 3
        let circle3 = SKShapeNode(circleOfRadius: 40)
        circle3.fillColor = .grayPurple
        circle3.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 40)
        
        
        //création du sprite 4
        let circle4 = SKShapeNode(circleOfRadius: 40)
        circle4.fillColor = .purpleText
        circle4.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 35)
        
        
        //création du sprite 5
        let circle5 = SKShapeNode(circleOfRadius: 40)
        circle5.fillColor = .purpleHover
        circle5.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 1)
        
        
        //création du sprite 6
        let circle6 = SKShapeNode(circleOfRadius: 40)
        circle6.fillColor = .lightGray
        circle6.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 1)
        
        
        //création du sprite 7
        let circle7 = SKShapeNode(circleOfRadius: 40)
        circle7.fillColor = .purpleDarkHover
        circle7.position = CGPoint(x: UIScreen.main.bounds.width - 200, y: UIScreen.main.bounds.height - 60)
        
        
        //création du sprite 8
        let circle8 = SKShapeNode(circleOfRadius: 40)
        circle8.fillColor = .grayPurple
        circle8.position = CGPoint(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 45)
        
        //création du sprite Button + son label + ajout de la sous vue dans la vue parente
        circleButton.fillColor = .purpleButton
        circleButton.position = CGPoint(x: UIScreen.main.bounds.width - 200, y: UIScreen.main.bounds.height - 1)
        
        circleButton.physicsBody = SKPhysicsBody(circleOfRadius: 65)
        circleButton.physicsBody?.affectedByGravity = true
        
        let circleButtonLabel = SKLabelNode(text: "Secouer")
        circleButtonLabel.fontName = "SFPro-ExpandedBold"
        circleButtonLabel.fontSize = 20
        circleButtonLabel.fontColor = .white
        circleButtonLabel.horizontalAlignmentMode = .center
        circleButtonLabel.verticalAlignmentMode = .center
        
        addChild(circleButton)
        circleButton.addChild(circleButtonLabel)
        
        //mon tableau de petits circles
        let spriteCircle = [circle, circle2, circle3, circle4, circle5, circle6, circle7, circle8]
        
        
        //ici boucle sur les sprites pour leur appliquer la physique appliquée dans la SKScene + ajouter les sous vues dans la vue parente
        for sprite in spriteCircle {
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 40)
            sprite.physicsBody?.affectedByGravity = true
            addChild(sprite)
        }
        
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        guard circleButton.contains(location) else {
            print("⚠️ [SpriteKit] Touch hors du bouton, ignoré")
            return
        }
        
        print("🎲 [SpriteKit] Bouton 'Secouer' cliqué")
        
            // animation pour mimer le comportement du bouton
            let scaleUp = SKAction.scale(to: 2.5, duration: 0.1)
            let scaleDown = SKAction.scale(to: 1.0, duration: 0.1)
            circleButton.run(SKAction.sequence([scaleUp, scaleDown]))
            
        Task { @MainActor in
                // Double vérification que challengeVM existe et a authViewModel
            guard let vm = self.challengeVM else {
                print("❌ [SpriteKit] challengeVM est nil")
                return
            }
            
            guard vm.authViewModel != nil else {
                print("❌ [SpriteKit] authViewModel n'est pas injecté")
                return
            }
            
            await vm.fetchRandomChallenge()
        }
        
            // Navigation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.navManager?.shouldNavigate = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //pour lire la data de l'accelerometre
        if let accData = motionManager.accelerometerData {
            let acc = accData.acceleration
                        
            physicsWorld.gravity = CGVector(dx: acc.x * 9.8, dy: acc.y * 9.8)
        }
    }
}

@Observable
class NavigationManager {
    var shouldNavigate : Bool = false
}

class BallsDashboardViewContainer : SKScene {
    
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //création ball 1
        let ball_1 = SKShapeNode(circleOfRadius: 25)
        ball_1.position = CGPoint(x: 10, y: 300)
        ball_1.fillColor = .purpleButton
        
        ball_1.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        ball_1.physicsBody?.affectedByGravity = true
        
        //création ball 2
        let ball_2 = SKShapeNode(circleOfRadius: 25)
        ball_2.position = CGPoint(x: 25, y: 300)
        ball_2.fillColor = .purpleDark
        
        ball_2.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        ball_2.physicsBody?.affectedByGravity = true
        
        //création ball 3
        let ball_3 = SKShapeNode(circleOfRadius: 25)
        ball_3.position = CGPoint(x: 30, y: 300)
        ball_3.fillColor = .purpleText
        
        ball_3.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        ball_3.physicsBody?.affectedByGravity = true
        
        //création ball 4
        let ball_4 = SKShapeNode(circleOfRadius: 25)
        ball_4.position = CGPoint(x: 40, y: 300)
        ball_4.fillColor = .purpleDarkHover
        
        ball_4.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        ball_4.physicsBody?.affectedByGravity = true
        
        //création ball 5
        let ball_5 = SKShapeNode(circleOfRadius: 25)
        ball_5.position = CGPoint(x: 35, y: 300)
        ball_5.fillColor = .purpleButton
        
        ball_5.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        ball_5.physicsBody?.affectedByGravity = true
        
        addChild(ball_1)
        addChild(ball_2)
        addChild(ball_3)
        addChild(ball_4)
        addChild(ball_5)
        
        if motionManager.isAccelerometerAvailable{
            motionManager.startAccelerometerUpdates()
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accData = motionManager.accelerometerData{
            let acc = accData.acceleration
            
            physicsWorld.gravity = CGVector(dx: acc.x * 9.8, dy: acc.y * 9.8)
        }
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        scene?.backgroundColor = .greenCustom
        becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    
    
}
