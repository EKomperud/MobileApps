//
//  File.swift
//  OGL_ClassTutorial
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import GLKit

class Sprite {
    
    var positionX: Float = 0.0
    var positionY: Float = 0.0
    
    var scaleX: Float = 1.0
    var scaleY: Float = 1.0
    
    var rotation: Float = 0.0
    
    let image: UIImage
    
    init(image: UIImage){
        self.image = image
        
        setup()
    }
    
    func setup() {
//        guard program != 0 else {
//            return
//        }
    }
    
    func draw() {
        
    }
}
