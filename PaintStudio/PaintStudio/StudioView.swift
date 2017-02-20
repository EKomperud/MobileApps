//
//  StudioView.swift
//  PaintStudio
//
//  Created by u0844210 on 2/18/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol StudioDelegate: class {
    func studio(studio: StudioView, painted stroke: Stroke)
}

class StudioView: UIView {
    
    // Brush settings
    let width: Float = 2.0
    let color: CGColor = UIColor.white.cgColor
    let lineJoin: CGLineJoin = CGLineJoin.round
    let lineCap: CGLineCap = CGLineCap.round
    
    // Painting
    let painting = Painting(AspectX: 100, AspectY: 100)
    
    // Current stroke
    var stroke = Stroke(W: 2.0, C: UIColor.white.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    // Declare delegate
    weak var delegate: StudioDelegate? = nil
    
    override func draw(_ rect: CGRect) {

        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setLineWidth(CGFloat(width))
        context.setStrokeColor(color)
        context.setLineJoin(lineJoin)
        context.setLineCap(lineCap)
        
        if let currentStroke = painting.GetLastStroke() {
            context.move(to: CGPoint(x: CGFloat((currentStroke.points.first?.x)!), y: CGFloat((currentStroke.points.first?.y)!)))
            for point in currentStroke.points {
                context.addLine(to: CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
            }
            context.drawPath(using: CGPathDrawingMode.stroke)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Create new stroke
        stroke = Stroke(W: width, C: color, Join: lineJoin, Cap: lineCap)
        
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(touchPoint.x), Y: Float(touchPoint.y))
        
        // Redraw lines
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(touchPoint.x), Y: Float(touchPoint.y))
        
        // Redraw lines
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(touchPoint.x), Y: Float(touchPoint.y))
        
        // Add stroke to painting
        painting.AddStroke(stroke: stroke)
        
        // Redraw lines
        setNeedsDisplay()
        
        // Send delegation
        delegate?.studio(studio: self, painted: stroke)
    }
}
