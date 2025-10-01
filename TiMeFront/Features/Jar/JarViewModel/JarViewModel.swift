//
//  JarViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 26/09/2025.
//

import Foundation
import SpriteKit

class JarViewModel {

}

class BallsViewContainer : SKScene {
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
        let circleButton = SKShapeNode(circleOfRadius: 65)
        circleButton.fillColor = .purpleButton
        circleButton.position = CGPoint(x: UIScreen.main.bounds.width - 200, y: UIScreen.main.bounds.height - 1)
        
        circleButton.physicsBody = SKPhysicsBody(circleOfRadius: 65)
        circleButton.physicsBody?.affectedByGravity = true
        
        
        addChild(circle)
        addChild(circle2)
        addChild(circle3)
        addChild(circle4)
        addChild(circle5)
        addChild(circle6)
        addChild(circle7)
        addChild(circle8)
        addChild(circleButton)
            
    }
}
