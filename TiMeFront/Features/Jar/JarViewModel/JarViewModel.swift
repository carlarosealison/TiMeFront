//
//  JarViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import SpriteKit
import UIKit
import CoreMotion

class JarViewModel {
    
}

class BallsViewContainer : SKScene {
    
    let motionManager = CMMotionManager()
    let circleButton = SKShapeNode(circleOfRadius: 65)
    let accData = CMAccelerometerData()
    
    override func didMove(to view: SKView) {
        
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
        
        if motionManager.isAccelerometerActive {
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
//        //pour lire la data de l'accelerometre
//        if let accData = motionManager.accelerometerData {
//            let acc = accData.acceleration
//            
////            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0 //60 mises à jour par seconde
//
//            physicsWorld.gravity = CGVector(dx: acc.x * 9.8, dy: acc.y * 9.8)
//        }
        
    }
    
    func distanceBetween(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return sqrt(dx*dx + dy*dy)
    }
    
    func startMotionUpdates(){
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0 //60 mises à jour par seconde
            motionManager.startDeviceMotionUpdates(to: .main) { [self] motion, _ in
                //mise en place du [self] au lieu des self. devant toutes les proprétés embed dans cette closure(ballPosition, circleRadius...) -> Swift nous fait prendre conscience qu'on est bien imbriqué dans cette closure (mesure de sécurité)
                if let motion = motion {
                    
                    //calcule la nouvelle position de la ball suite à un mouvement
                    let x = CGFloat(motion.gravity.x) * 30
                    let y = CGFloat(motion.gravity.y) * 30
                    
                    //vérifie que la ball est contenue dans la bordure
                    let newX = circleButton.position.x + x
                    let newY = circleButton.position.y + y
                    _ = distanceBetween(point1: CGPoint(x: 0, y: 0), point2: CGPoint(x: newX, y: newY))
                    
//                    if distanceFromCenter <= (circleRadius - ballRadius) {
//                        circleButton.position = CGPoint(x: newX, y: newY)
//                    } else {
//                        let angle = atan2(newY, newX)
//                        let boundedX = (circleRadius - ballRadius) * cos(angle)
//                        let boundedY = (circleRadius - ballRadius) * sin(angle)
//                        circleButton.position = CGPoint(x: boundedX, y: boundedY)
//                    }
                }
            }
        }
        
        
    }
    
    func startAccelerometerData(){
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.1
        }
    }

    
}
