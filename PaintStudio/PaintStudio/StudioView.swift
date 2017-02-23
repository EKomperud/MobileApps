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
    
    func created(studio: StudioView, withCanvas painting: Painting)
    
    func brushSelect(studio: StudioView)
}

class StudioView: UIView {
    
    // Brush settings
    var width: Float = 2.0
    var color: CGColor = UIColor.white.cgColor
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    
    // Painting
    let painting = Painting(AspectX: 100.0, AspectY: 200.0)
    var index = 0
    
    // Current stroke
    var stroke = Stroke(W: 2.0, C: UIColor.white.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    // Declare delegate
    var delegate: StudioDelegate! //= nil
    var recorded: Bool = false
    
    init() {
        super.init(frame: CGRect())
        let brushSelector: UIButton = UIButton(frame: CGRect(x: frame.maxX / 2, y: 20, width: 50, height: 100))
        brushSelector.setTitle("Brush Selector", for: .normal)
        brushSelector.addTarget(self, action: #selector(brushSelect), for: .touchUpInside)
        self.addSubview(brushSelector)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect())
    }
    
    override func draw(_ rect: CGRect) {

        if !recorded {
            delegate?.created(studio: self, withCanvas: painting)
            recorded = true
        }
        
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
        delegate?.studio(studio: self, painted: stroke)
    }
    
    func brushSelect() {
        delegate.brushSelect(studio: self)
    }
}
