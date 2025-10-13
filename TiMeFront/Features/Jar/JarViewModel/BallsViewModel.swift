//
//  BallsViewModel.swift
//  TiMeFront
//
//  Created by Apprenant125 on 01/10/2025.
//

import Foundation
import CoreMotion

@Observable
class BallsViewModel : ObservableObject {
    
    var motionManager : CMMotionManager
    var ballPosition = CGPoint(x: 0, y: 0)
    
    
    var circleRadius : CGFloat = 150
    var ballRadius : CGFloat = 25
    
    init(motionManager: CMMotionManager, ballPosition: CGPoint = CGPoint(x: 0, y: 0)) {
        self.motionManager = motionManager
        self.ballPosition = ballPosition
    }
    
    func distanceBetween(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return sqrt(dx*dx + dy*dy)
    }
    
    //fonction pour mettre en place la mise à jour de la position de la balle en fonction des mouvements de l'appareil
    
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
                    let newX = ballPosition.x + x
                    let newY = ballPosition.y + y
                    let distanceFromCenter = distanceBetween(point1: CGPoint(x: 0, y: 0), point2: CGPoint(x: newX, y: newY))
                    
                    if distanceFromCenter <= (circleRadius - ballRadius) {
                        ballPosition = CGPoint(x: newX, y: newY)
                        

                    } else {
                        let angle = atan2(newY, newX)
                        let boundedX = (circleRadius - ballRadius) * cos(angle)
                        let boundedY = (circleRadius - ballRadius) * sin(angle)
                        ballPosition = CGPoint(x: boundedX, y: boundedY)
                    }
                }
            }
        }
        
        
    }
}
