//
//  Level00-2.swift
//  MC3
//
//  Created by Salvatore Manna on 15/02/22.
//

import UIKit
import SpriteKit


class Level00_2: SKScene {

    
    let room2 = SKSpriteNode(imageNamed: "Room2")
    
    override func didMove(to view: SKView) {
        room2.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        room2.xScale = 0.8
        room2.yScale = 0.8
        
        addChild(room2)
    }
    
    
}
