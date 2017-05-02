//
//  MonsterToken.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 5/1/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol TokenDelegate: class {
    func touched (token: MonsterToken)
}

class MonsterToken: UIView {
    var mon: Monster?
    var image: UIImage?
    var touched = false
    weak var delegate: TokenDelegate? = nil
    
    init(frame: CGRect, monster: Monster) {
        super.init(frame: frame) 
        mon = monster
        self.image = mon?._Portrait
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        image?.draw(in: rect)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touched(token: self)
    }
}
