//
//  JarTest.swift
//  TiMeFront
//
//  Created by Apprenant125 on 02/10/2025.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    let motionManager = CMMotionManager()

    override func didMove(to view: SKView) {
        backgroundColor = .white

        // Add a ball
        let ball = SKShapeNode(circleOfRadius: 20)
        ball.fillColor = .blue
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball.physicsBody?.restitution = 0.6 // bouncy
        addChild(ball)

        // Add a border so balls don’t fall off screen
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        // Start CoreMotion updates
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates()
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Read accelerometer data
        if let accelData = motionManager.accelerometerData {
            let accel = accelData.acceleration
            // Map device tilt to SpriteKit gravity
            physicsWorld.gravity = CGVector(dx: accel.x * 9.8, dy: accel.y * 9.8)
        }
    }
}
