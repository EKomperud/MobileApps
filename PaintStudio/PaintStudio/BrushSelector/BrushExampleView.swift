//
//  BrushExampleView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class BrushExampleView: UIView {

    var _brushCapStyle: CGLineCap = CGLineCap.round
    var _brushJoinStyle: CGLineJoin = CGLineJoin.bevel
    var _color: CGColor = UIColor.black.cgColor
    var _width: Float = 0.5
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.move(to: CGPoint(x: 30, y: (bounds.height) - 50))
        context.addLine(to: CGPoint(x: 95, y: (bounds.height) - 88))
        context.addLine(to: CGPoint(x: 125, y: (bounds.height) - 45))
        context.addLine(to: CGPoint(x: 165, y: (bounds.height) - 80))
        context.addLine(to: CGPoint(x: 270, y: (bounds.height) - 65))
        context.setLineCap(_brushCapStyle)
        context.setLineJoin(_brushJoinStyle)
        context.setLineWidth(CGFloat(_width))
        context.setStrokeColor(_color)
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    func capStyleChanged(capStyle: CGLineCap) {
        _brushCapStyle = capStyle
        setNeedsDisplay()
    }
    
    func joinStyleChanged(joinStyle: CGLineJoin) {
        _brushJoinStyle = joinStyle
        setNeedsDisplay()
    }
    
    func widthChanged(newWidth: Float) {
        _width = newWidth
        setNeedsDisplay()
    }
    
    func colorChanged(newColor: CGColor) {
        _color = newColor
        setNeedsDisplay()
    }
}
