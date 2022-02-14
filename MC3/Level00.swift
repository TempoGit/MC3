//
//  Level00.swift
//  MC3
//
//  Created by Salvatore Manna on 14/02/22.
//

import UIKit
import SpriteKit

class Level00: SKScene {

    let goBackLabel = SKLabelNode(text: "Go Back")
    
    let room1 = SKSpriteNode(imageNamed: "Room 1")
    
    let barrier1 = SKSpriteNode(imageNamed: "Barrier1")
    
    var worldGroup = SKSpriteNode()
    
    let player = SKSpriteNode(imageNamed: "PlayerBox")
    
    var move: Bool = false
    var location = CGPoint.zero
    
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
        
        worldGroup.addChild(room1)
        worldGroup.addChild(barrier1)
        addChild(worldGroup)
        
        player.position = CGPoint(x: size.width*0.5, y: size.height*0.35)
        player.xScale = 0.12
        player.yScale = 0.12
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.restitution = 0
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.isDynamic = true
        addChild(player)
        
        goBackLabel.name = "goBackName"
        goBackLabel.position = CGPoint(x: size.width*0.2,y: size.height*0.9)
        addChild(goBackLabel)
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
        
        worldGroup.position.x += 10
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        move = true
        print("Is touched")
        for touch in touches {
            location = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        move = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(move){
            if(location.x > player.position.x) {
                player.position.x += 0.8
                worldGroup.position.x -= 0.6
                if(location.y > player.position.y){
                    player.position.y += 0.8
                    
                } else if(location.y < player.position.y){
                    player.position.y -= 0.8
                }
            } else if (location.x < player.position.x){
                player.position.x -= 0.8
                worldGroup.position.x += 0.6
                if(location.y > player.position.y){
                    player.position.y += 0.8
                    
                } else if(location.y < player.position.y){
                    player.position.y -= 0.8
                }
            }
//            if(location.y != player.position.y){
//                if( (location.x - player.position.x) > 0 ){
//                    player.position.x += 0.5
//                    print(location.x)
//                } else if ( (location.x - player.position.x) < 0 ){
//                    player.position.x -= 0.5
//                    print(location.x)
//                }
//            }
        }
    }
}
