//
//  HelloScene.swift
//  Myspritekit
//
//  Created by mac08 on 2020/4/1.
//  Copyright © 2020 mac08. All rights reserved.
//

import UIKit
import SpriteKit


class HelloScene: SKScene {
    
    override func didMove(to view: SKView){
        createScene()
    }
    func createScene(){
        let bgd = SKSpriteNode(imageNamed: "hellobgd.jpg")
        let v = SKVideoNode(fileNamed: "v.mov")
        v.size = self.frame.size
        v.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        print(v)
        
        bgd.size.width = self.size.width
        bgd.size.height = self.size.height
        bgd.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bgd.zPosition = -1
        
        let hellolabel = SKLabelNode(text: "轟隆隆隆🤣🤣隆隆隆隆衝衝衝衝😏😏😏拉風😎😎😎")
        hellolabel.name = "label"
        hellolabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY+300)
        hellolabel.fontName = "Avenir-Oblique"
        hellolabel.fontSize = 18
    
        
        
        self.addChild(v)
        v.speed  =  15
        v.play()
        
        //self.addChild(bgd)
        self.addChild(hellolabel)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let labelNode = self.childNode(withName: "label")
        let moveup = SKAction.moveBy(x: 0, y: 200, duration: 1)
        let zoomin = SKAction.scale(to: 3.0, duration: 1)
        let pause = SKAction.wait(forDuration: 0.5)
        let zoomout = SKAction.scale(by: 0.5, duration: 0.25)
        let fadeway = SKAction.fadeOut(withDuration: 0.25)
        let remove = SKAction.removeFromParent()
        let movesequence = SKAction.sequence([moveup,zoomin,pause,zoomout,pause,fadeway,remove])
        labelNode?.run(movesequence, completion: {
            let mainScene = MainScene(size: self.size)
            let doors = SKTransition.doorsOpenVertical(withDuration: 0.5)
            self.view?.presentScene(mainScene, transition: doors)
        })
    }
}
