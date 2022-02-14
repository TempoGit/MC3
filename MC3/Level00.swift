//
//  Level00.swift
//  MC3
//
//  Created by Salvatore Manna on 14/02/22.
//

import UIKit
import SpriteKit

struct PhysicsCategories {
    static let Player : UInt32 = 0x1 << 0
    static let MapEdge : UInt32 = 0x1 << 1
//    static let Redball : UInt32 = 0x1 << 2
}

class Level00: SKScene, SKPhysicsContactDelegate {
    

    let goBackLabel = SKLabelNode(text: "Go Back")
    
    let room1 = SKSpriteNode(imageNamed: "Room 1")
    
    let barrier1 = SKSpriteNode(imageNamed: "Barrier1")
    let barrier2 = SKSpriteNode(imageNamed: "Barrier2")
    let barrier3 = SKSpriteNode(imageNamed: "Barrier3")
    let barrier4 = SKSpriteNode(imageNamed: "Barrier4")
    
    
    
    var worldGroup = SKSpriteNode()
    
    let player = SKSpriteNode(imageNamed: "PlayerBox")
    
    var move: Bool = false
    var moveSingle: Bool = false
    var location = CGPoint.zero
    
    let cameraNode = SKCameraNode()
    
    let squareTest1 = SKShapeNode(rectOf: CGSize(width: 100,height: 100))
    
    override func didMove(to view: SKView) {
        room1.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        room1.xScale = 0.8
        room1.yScale = 0.8
        
        barrier1.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        barrier1.xScale = 0.8
        barrier1.yScale = 0.8
        barrier1.physicsBody = SKPhysicsBody(texture: barrier1.texture!, size: barrier1.size)
        barrier1.physicsBody?.affectedByGravity = false
        barrier1.physicsBody?.restitution = 0
        barrier1.physicsBody?.allowsRotation = false
        barrier1.physicsBody?.isDynamic = false
        barrier1.physicsBody?.categoryBitMask = PhysicsCategories.MapEdge
        barrier1.physicsBody?.contactTestBitMask = PhysicsCategories.Player
        barrier1.alpha = 0.01
        barrier1.name = "outerBarrier"
        
        barrier2.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        barrier2.xScale = 0.8
        barrier2.yScale = 0.8
        barrier2.physicsBody = SKPhysicsBody(texture: barrier2.texture!, size: barrier2.size)
        barrier2.physicsBody?.affectedByGravity = false
        barrier2.physicsBody?.restitution = 0
        barrier2.physicsBody?.allowsRotation = false
        barrier2.physicsBody?.isDynamic = false
        barrier2.physicsBody?.categoryBitMask = PhysicsCategories.MapEdge
        barrier2.physicsBody?.contactTestBitMask = PhysicsCategories.Player
        barrier2.alpha = 0.01
        barrier2.name = "outerBarrier"
        
        barrier3.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        barrier3.xScale = 0.8
        barrier3.yScale = 0.8
        barrier3.physicsBody = SKPhysicsBody(texture: barrier3.texture!, size: barrier3.size)
        barrier3.physicsBody?.affectedByGravity = false
        barrier3.physicsBody?.restitution = 0
        barrier3.physicsBody?.allowsRotation = false
        barrier3.physicsBody?.isDynamic = false
        barrier3.physicsBody?.categoryBitMask = PhysicsCategories.MapEdge
        barrier3.physicsBody?.contactTestBitMask = PhysicsCategories.Player
        barrier3.alpha = 0.01
        barrier3.name = "outerBarrier"
        
        barrier4.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        barrier4.xScale = 0.8
        barrier4.yScale = 0.8
        barrier4.physicsBody = SKPhysicsBody(texture: barrier4.texture!, size: barrier4.size)
        barrier4.physicsBody?.affectedByGravity = false
        barrier4.physicsBody?.restitution = 0
        barrier4.physicsBody?.allowsRotation = false
        barrier4.physicsBody?.isDynamic = false
        barrier4.physicsBody?.categoryBitMask = PhysicsCategories.MapEdge
        barrier4.physicsBody?.contactTestBitMask = PhysicsCategories.Player
        barrier4.alpha = 0.01
        barrier4.name = "outerBarrier"
        
        worldGroup.addChild(room1)
        worldGroup.addChild(barrier1)
        worldGroup.addChild(barrier2)
        worldGroup.addChild(barrier3)
        worldGroup.addChild(barrier4)
        addChild(worldGroup)
        
        player.position = CGPoint(x: size.width*0.5, y: size.height*0.35)
        player.xScale = 0.12
        player.yScale = 0.12
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.restitution = 0
        player.physicsBody?.allowsRotation = false
//        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = PhysicsCategories.Player
        player.physicsBody?.contactTestBitMask = PhysicsCategories.MapEdge
        player.name = "playerName"
        addChild(player)
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = player.position
        
        
        goBackLabel.name = "goBackName"
        goBackLabel.position = CGPoint(x: size.width*0.2,y: size.height*0.9)
        addChild(goBackLabel)
        
        squareTest1.position = CGPoint(x: size.width*0.8,y: size.height*0.3)
        squareTest1.fillColor = .black
        squareTest1.strokeColor = .black
        addChild(squareTest1)
        
        self.scene?.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        
        if(touchedNode.name == "goBackName"){
            let gameScene = GameScene(size: size)
            view?.presentScene(gameScene)
        }
        
        if(touchLocation != player.position){
            location = touchLocation
            moveSingle = true
//            let movePlayerAction = SKAction.move(to: touchLocation, duration: 1)
//            player.run(movePlayerAction)
        }
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        player.removeAllActions()
        moveSingle = false
        move = true
        for touch in touches {
            location = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        move = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if(move || moveSingle){
            if(location.x > player.position.x) {
                player.position.x += 0.8
//                if(!stopCamera){
//                    worldGroup.position.x -= 0.8
//                }
//                worldGroup.position.x -= 0.8
                if(location.y > player.position.y){
                    player.position.y += 0.8
                    
                } else if(location.y < player.position.y){
                    player.position.y -= 0.8
                }
            } else if (location.x < player.position.x){
                player.position.x -= 0.8
//                if(!stopCamera){
//                    worldGroup.position.x += 0.8
//                }
//                worldGroup.position.x += 0.8
                if(location.y > player.position.y){
                    player.position.y += 0.8
                    
                } else if(location.y < player.position.y){
                    player.position.y -= 0.8
                }
            } else if (location.y > player.position.y){
                player.position.y += 0.8
            } else if (location.y < player.position.y){
                player.position.y -= 0.8
            }
        }
        cameraNode.position = player.position
        
        checkCollisions()
    }
    
    func checkCollisions(){
        if(player.frame.intersects(self.squareTest1.frame)){
            print("Intersection")
//            squareTest1.zPosition = 5
//            player.zPosition = 10
            print(squareTest1.position.x)
            print(player.position.x)
            if(squareTest1.position.x > player.position.x){
                squareTest1.alpha = 0.2
            } else {
                squareTest1.alpha = 1
                player.zPosition = 10
            }
            
        } else {
            print("Don't intersect")
            squareTest1.alpha = 1
        }
    }
}
