//
//  KnobView.swift
//  InClassExamples
//
//  Created by u0844210 on 2/8/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class KnobView: UIView{
    override func draw(_ rect: CGRect) {
        let knobRect: CGRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.height)
        var nibRect: CGRect = CGRect(x: 0.0, y: knobRect.size.height / 2.0, width: knobRect.width / 5.0, height: knobRect.width / 5.0)
        
        nibRect.origin.y -= nibRect.height / 2.0
        nibRect.origin.x = knobRect.width - nibRect.width
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        
        context.setFillColor(UIColor.black.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
    }
}
