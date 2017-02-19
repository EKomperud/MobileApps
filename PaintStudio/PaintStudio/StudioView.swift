//
//  StudioView.swift
//  PaintStudio
//
//  Created by u0844210 on 2/18/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class StudioView: UIView {
    
    // Brush settings
    let width: Float = 0.0
    let color: CGColor = UIColor.black.cgColor
    let lineJoin: CGLineJoin = CGLineJoin.round
    let lineCap: CGLineCap = CGLineCap.round
    
    // Painting
    let painting = Painting(AspectX: 100, AspectY: 100)
    
    // Current stroke
    var stroke = Stroke(W: 0.0, C: UIColor.black.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    override func draw(_ rect: CGRect) {
        <#code#>
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
    }
}
