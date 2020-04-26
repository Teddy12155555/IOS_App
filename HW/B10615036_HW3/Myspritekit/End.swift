//
//  End.swift
//  Myspritekit
//
//  Created by 黃泰銘 on 2020/4/23.
//  Copyright © 2020 mac08. All rights reserved.
//

import UIKit
import SpriteKit

class End: SKScene {

    
    override func didMove(to view: SKView){
        createScene()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        MainScene.Score = 0;
        let mainScene = MainScene(size: self.size)
        let doors = SKTransition.doorsOpenVertical(withDuration: 0.5)
        self.view?.presentScene(mainScene, transition: doors)
    }
    func createScene(){
        let bgd = SKSpriteNode(imageNamed: "hellobgd.jpg")
        bgd.size.width = self.size.width
        bgd.size.height = self.size.height
        bgd.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bgd.zPosition = -1
        
        let hellolabel = SKLabelNode(text: "Game Over Touch to restart")
        hellolabel.name = "label"
        hellolabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        hellolabel.fontName = "Avenir-Oblique"
        hellolabel.fontSize = 28
    
        let hello2label = SKLabelNode(text: "Your Score : \(MainScene.Score)")
        hello2label.name = "label"
        hello2label.position = CGPoint(x: self.frame.midX, y: self.frame.midY+50)
        hello2label.fontName = "Avenir-Oblique"
        hello2label.fontSize = 28
        
        
        self.addChild(bgd)
        self.addChild(hellolabel)
        self.addChild(hello2label)
    }
}
