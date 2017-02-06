//
//  BrushExampleView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class BrushExampleView: UIView, BrushJoinDelegate, BrushCapDelegate {
    
    var brushCapStyle: CGLineCap = CGLineCap.round
    var brushJoinStyle: CGLineJoin = CGLineJoin.bevel
    var width: Float = 0.5
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.move(to: CGPoint(x: 50, y: (window?.bounds.height)! - 30))
        context.addLine(to: CGPoint(x: 125, y: (window?.bounds.height)! - 70))
        context.addLine(to: CGPoint(x: 170, y: (window?.bounds.height)! - 35))
        context.addLine(to: CGPoint(x: 230, y: (window?.bounds.height)! - 60))
        context.addLine(to: CGPoint(x: 300, y: (window?.bounds.height)! - 45))
        context.setLineCap(brushCapStyle)
        context.setLineJoin(brushJoinStyle)
        context.setLineWidth(CGFloat(width))
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    func brushCap(brushCap: BrushCapView, StylePicked style: CGLineCap) {
        brushCapStyle = style
        setNeedsDisplay()
    }
    
    func brushJoin(brushJoin: BrushJoinView, StylePicked style: CGLineJoin) {
        brushJoinStyle = style
        setNeedsDisplay()
    }
    
    func widthSliderChanged (widthValue: Float) {
        width = widthValue
        setNeedsDisplay()
    }
}
