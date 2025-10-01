//
//  ViewController.swift
//  TiMeFront
//
//  Created by Apprenant125 on 30/09/2025.
//

import UIKit
import SpriteKit

class BallsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    class BallsView : SKScene{
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
