//
//  JarViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import SpriteKit
import CoreMotion
import UIKit

class JarViewModel {
    
}

class BallsViewContainer : SKScene {
    
    let motionManager = CMMotionManager()
    let circleButton = SKShapeNode(circleOfRadius: 65)
    //    let accData = CMAccelerometerData()
    
    override func didMove(to view: SKView) {
        
        // pour déterminer la frame à ne pas dépasser
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        //création du sprite 1
        let circle = SKShapeNode(circleOfRadius: 40)
        circle.fillColor = .purpleDark
        circle.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 40)
        
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle.physicsBody?.affectedByGravity = true
        
        //création du sprite 2
        let circle2 = SKShapeNode(circleOfRadius: 40)
        circle2.fillColor = .purpleHover
        circle2.position = CGPoint(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 50)
        
        circle2.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle2.physicsBody?.affectedByGravity = true
        
        //création du sprite 3
        let circle3 = SKShapeNode(circleOfRadius: 40)
        circle3.fillColor = .grayPurple
        circle3.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 40)
        
        circle3.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle3.physicsBody?.affectedByGravity = true
        
        
        //création du sprite 4
        let circle4 = SKShapeNode(circleOfRadius: 40)
        circle4.fillColor = .purpleText
        circle4.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 35)
        
        circle4.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle4.physicsBody?.affectedByGravity = true
        
        //création du sprite 5
        let circle5 = SKShapeNode(circleOfRadius: 40)
        circle5.fillColor = .purpleHover
        circle5.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 1)
        
        circle5.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle5.physicsBody?.affectedByGravity = true
        
        //création du sprite 6
        let circle6 = SKShapeNode(circleOfRadius: 40)
        circle6.fillColor = .lightGray
        circle6.position = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 1)
        
        circle6.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle6.physicsBody?.affectedByGravity = true
        
        //création du sprite 7
        let circle7 = SKShapeNode(circleOfRadius: 40)
        circle7.fillColor = .purpleDarkHover
        circle7.position = CGPoint(x: UIScreen.main.bounds.width - 200, y: UIScreen.main.bounds.height - 60)
        
        circle7.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle7.physicsBody?.affectedByGravity = true
        
        //création du sprite 8
        let circle8 = SKShapeNode(circleOfRadius: 40)
        circle8.fillColor = .grayPurple
        circle8.position = CGPoint(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 45)
        
        circle8.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle8.physicsBody?.affectedByGravity = true
        
        //création du sprite Button
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
        
        
        addChild(circle)
        addChild(circle2)
        addChild(circle3)
        addChild(circle4)
        addChild(circle5)
        addChild(circle6)
        addChild(circle7)
        addChild(circle8)
        addChild(circleButton)
        circleButton.addChild(circleButtonLabel)
        
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if circleButton.contains(location){
            // animation pour mimer le comportement du bouton
            let scaleUp = SKAction.scale(to: 2.5, duration: 0.1)
            let scaleDown = SKAction.scale(to: 1.0, duration: 0.1)
            circleButton.run(SKAction.sequence([scaleUp, scaleDown]))
            
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        //pour lire la data de l'accelerometre
        if let accData = motionManager.accelerometerData {
            let acc = accData.acceleration
            
            //            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0 //60 mises à jour par seconde
            
            physicsWorld.gravity = CGVector(dx: acc.x * 9.8, dy: acc.y * 9.8)
        }
        
    }
}

class BallsDashboardViewContainer : SKScene {
    
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        let h = frame.height
        let w = frame.width
        let cornerRadius: CGFloat
//        let pathCornerRadius = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: w, height: h), cornerRadius: cornerRadius)
            
                
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        <#code#>
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let alert = UIAlertController(title: "Detected Shake", message: "I'll change that page to use my animated balls insted", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//            present(alert, animated : true)
        }
    }
}
