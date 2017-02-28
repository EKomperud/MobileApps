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
    
    func AspectSent(i: Int, x: CGFloat, y: CGFloat)
}

class PaintingView: UIView {
    
    // Painting
    var painting: Painting = Painting(AspectX: 100, AspectY: 200)
    var _aspectSent: Bool = false
    var _tempX: CGFloat = 0
    var _tempY: CGFloat = 0
    
    // Brush settings
    var width: Float = 2.0
    var color: CGColor = UIColor.black.cgColor
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    
    // Current stroke
    var stroke = Stroke(W: 2.0, C: UIColor.black.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    // Delegate
    var delegate: CanvasDelegate? = nil
    
    func SetAspectRatio() {
        painting.aspectX = frame.width
        painting.aspectY = frame.height
        delegate?.AspectSent(i: painting.index, x: painting.aspectX, y: painting.aspectY)
        _aspectSent = true
    }
    
    func TempAsepects() {
        if (frame.width != painting.aspectX) {
            let ratioX = frame.width / painting.aspectX
            let ratioY = frame.height / painting.aspectY
            if ratioX < ratioY {
                _tempX = painting.aspectX * ratioX; _tempY = painting.aspectY * ratioX
            }
            else {
                _tempX = painting.aspectX * ratioY; _tempY = painting.aspectY * ratioY
            }
            frame = CGRect(x: 0, y: 0, width: _tempX, height: _tempY)
        }
        else {
            _tempX = 0; _tempY = 0
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if !_aspectSent { SetAspectRatio() }
        TempAsepects()
        if _tempX == 0 {
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
        else {
            let context: CGContext = UIGraphicsGetCurrentContext()!
            
            for s in painting.strokes {
                context.setStrokeColor(s.color)
                context.setLineCap(s.lineCap)
                context.setLineJoin(s.lineJoin)
                context.setLineWidth(CGFloat(s.width))
                context.move(to: CGPoint(x: CGFloat((s.points.first?.x)!) * _tempX, y: CGFloat((s.points.first?.y)!) * _tempY))
                for point in s.points {
                    context.addLine(to: CGPoint(x: CGFloat(point.x) * _tempX, y: CGFloat(point.y) * _tempY))
                }
                context.drawPath(using: .stroke)
            }
            
            if !stroke.IsEmpty() {
                context.setStrokeColor(color)
                context.setLineCap(lineCap)
                context.setLineJoin(lineJoin)
                context.setLineWidth(CGFloat(width))
                context.move(to: CGPoint(x: CGFloat((stroke.points.first?.x)!) * _tempX, y: CGFloat((stroke.points.first?.y)!) * _tempY))
                for point in stroke.points {
                    context.addLine(to: CGPoint(x: CGFloat(point.x) * _tempX, y: CGFloat(point.y) * _tempY))
                }
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
        var modelPoint: CGPoint = CGPoint()
        var add: Bool = true
        if _tempX == 0 {
            modelPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        }
        else {
            modelPoint = CGPoint(x: touchPoint.x / _tempX, y: touchPoint.y / _tempY)
            if modelPoint.x > 1.0 || modelPoint.y > 1.0 {
                add = false
            }
        }
        
        if add {
            // Add point to stroke
            stroke.AddPoint(X: Float(modelPoint.x), Y: Float(modelPoint.y))
            
            // Redraw lines
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        //let modelPoint: CGPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        var modelPoint: CGPoint = CGPoint()
        var add: Bool = true
        if _tempX == 0 {
            modelPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        }
        else {
            modelPoint = CGPoint(x: touchPoint.x / _tempX, y: touchPoint.y / _tempY)
            if modelPoint.x > 1.0 || modelPoint.y > 1.0 {
                add = false
            }
        }
        
        if add {
            // Add point to stroke
            stroke.AddPoint(X: Float(modelPoint.x), Y: Float(modelPoint.y))
            
            // Redraw lines
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get X and Y positions
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        var modelPoint: CGPoint = CGPoint()
        var add: Bool = true
        if _tempX == 0 {
            modelPoint = CGPoint(x: touchPoint.x / painting.aspectX, y: touchPoint.y / painting.aspectY)
        }
        else {
            modelPoint = CGPoint(x: touchPoint.x / _tempX, y: touchPoint.y / _tempY)
            if modelPoint.x > 1.0 || modelPoint.y > 1.0 {
                add = false
            }
        }
        
        if add {
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
}
