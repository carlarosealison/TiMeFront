//
//  BallsViewContainer.swift
//  TiMeFront
//
//  Created by Apprenant125 on 01/10/2025.
//

import SpriteKit


//struct BallsViewContainer : UIViewRepresentable {
//    func makeUIView(context: Context) -> SKSpriteNode {
//        
//            let circle = SKSpriteNode()
//            circle.size = CGSize(width: 10, height: 10)
//            
//            //mise en place des propriétés physiques
//            circle.physicsBody = SKPhysicsBody(circleOfRadius: 75)
//            
//            // comment le srpite est affecté par la gravité
//            circle.physicsBody?.isDynamic = true
//            circle.physicsBody?.affectedByGravity = true
//            
//        return circle
//            //ajout de la vue
////        let view = SKView()
////        
////        //création de la scene
////        let scene = BallsView0()
////        scene.scaleMode = .resizeFill
////        
////        //on l'affiche dans le SKView
////        view.presentScene(scene)
////        return view
//    }
//    func updateUIView(_ uiView: SKSpriteNode, context: Context) { }
//    
//    
//}

class BallsViewContainer : SKScene {
    override func didMove(to view: SKView) {
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            
        //création du sprite
        let circle = SKSpriteNode()
        circle.size = CGSize(width: 75, height: 75)
        circle.color = .gray
        circle.position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 1)
        
        circle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 71, height: 71))
        circle.physicsBody?.affectedByGravity = true
        
        addChild(circle)
    }
}
