//
//  PaintingView.swift
//  PaintStudio
//
//  Created by u0844210 on 2/26/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol CanvasDelegate: class {
    func Painted(Canvas: PaintingView, painted: Stroke)
}

class PaintingView: UICollectionViewCell {
    
    // Painting
    let painting: Painting = Painting(AspectX: 100, AspectY: 200)
    
    // Brush settings
    var width: Float = 2.0
    var color: CGColor = UIColor.black.cgColor
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    
    // Current stroke
    var stroke = Stroke(W: 2.0, C: UIColor.black.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    // Delegate
    var delegate: CanvasDelegate? = nil
    
    override func draw(_ rect: CGRect) {
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        for s in painting.strokes {
            context.setStrokeColor(s.color)
            context.setLineCap(s.lineCap)
            context.setLineJoin(s.lineJoin)
            context.setLineWidth(CGFloat(s.width))
            context.move(to: CGPoint(x: CGFloat((s.points.first?.x)!) * painting.aspectX, y: CGFloat((s.points.first?.y)!) * painting.aspectY))
            for point in s.points {
                context.addLine(to: CGPoint(x: CGFloat(point.x) * painting.aspectX, y: CGFloat(point.y) * painting.aspectY))
            }
            context.drawPath(using: .stroke)
        }
        
        if !stroke.IsEmpty() {
            context.setStrokeColor(color)
            context.setLineCap(lineCap)
            context.setLineJoin(lineJoin)
            context.setLineWidth(CGFloat(width))
            context.move(to: CGPoint(x: CGFloat((stroke.points.first?.x)!) * painting.aspectX, y: CGFloat((stroke.points.first?.y)!) * painting.aspectY))
            for point in stroke.points {
                context.addLine(to: CGPoint(x: CGFloat(point.x) * painting.aspectX, y: CGFloat(point.y) * painting.aspectY))
            }
        }
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Create new stroke
        stroke = Stroke(W: width, C: color, Join: lineJoin, Cap: lineCap)
        
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        let modelPoint: CGPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(modelPoint.x), Y: Float(modelPoint.y))
        
        // Redraw lines
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        let modelPoint: CGPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(modelPoint.x), Y: Float(modelPoint.y))
        
        // Redraw lines
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        let modelPoint: CGPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        
        // Add point to stroke
        stroke.AddPoint(X: Float(modelPoint.x), Y: Float(modelPoint.y))
        
        // Add stroke to painting
        painting.AddStroke(stroke: stroke)
        
        // Redraw lines
        setNeedsDisplay()
        
        // Send delegation
        delegate?.Painted(Canvas: self, painted: stroke)
    }
    
}
