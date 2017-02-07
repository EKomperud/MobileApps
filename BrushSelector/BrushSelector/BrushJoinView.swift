//
//  BrushJoinView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol BrushJoinDelegate: class {
    func brushJoin(brushJoin: BrushJoinView, StylePicked style: CGLineJoin)
}

class BrushJoinView: UIView {
    
    private var _choice: CShort = 0
    
    weak var delegate: BrushJoinDelegate? = nil
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.addRect(CGRect(x:0,y:0,width:bounds.width,height:bounds.height))
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(3.0)
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        context.setLineWidth(10.0)
        
        context.setStrokeColor(UIColor.white.cgColor)
        if (_choice == 0){
            context.setStrokeColor(UIColor.magenta.cgColor)
        }
        context.setLineJoin(CGLineJoin.bevel)
        context.move(to: CGPoint(x:17.5,y:15))
        context.addLine(to: CGPoint(x:47.5,y:45))
        context.addLine(to: CGPoint(x:77.5,y:15))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        context.setStrokeColor(UIColor.white.cgColor)
        if (_choice == 1){
            context.setStrokeColor(UIColor.magenta.cgColor)
        }
        context.setLineJoin(CGLineJoin.miter)
        context.move(to: CGPoint(x:95,y:15))
        context.addLine(to: CGPoint(x:125,y:45))
        context.addLine(to: CGPoint(x:155,y:15))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        context.setStrokeColor(UIColor.white.cgColor)
        if (_choice == 2){
            context.setStrokeColor(UIColor.magenta.cgColor)
        }
        context.setLineJoin(CGLineJoin.round)
        context.move(to: CGPoint(x:172.5,y:15))
        context.addLine(to: CGPoint(x:202.5,y:45))
        context.addLine(to: CGPoint(x:232.5,y:15))
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        var x = touchPoint.x
        if (x > bounds.width) {
            x = bounds.width
        }
        else if (x < 0) {
            x = 0
        }
        
        if (x < 91.25) {
            choice = 0
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.bevel)
        }
        else if (x >= 91.25 && x < 158.25) {
            choice = 1
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.miter)
        }
        else {
            choice = 2
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.round)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        var x = touchPoint.x
        if (x > bounds.width) {
            x = bounds.width
        }
        else if (x < 0) {
            x = 0
        }
        
        if (x < 91.25) {
            choice = 0
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.bevel)
        }
        else if (x >= 91.25 && x < 158.25) {
            choice = 1
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.miter)
        }
        else {
            choice = 2
            delegate?.brushJoin(brushJoin: self, StylePicked: CGLineJoin.round)
        }
    }
    
    var choice : CShort {
        get {
            return _choice
        }
        set {
            _choice = newValue
            setNeedsDisplay()
        }
    }
}

