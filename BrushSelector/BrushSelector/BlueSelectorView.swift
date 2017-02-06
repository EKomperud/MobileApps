//
//  BlueSelectorView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol BlueSelectorDelegate: class {
    func blueSelector(redSelector: BlueSelectorView, rotatedToAngle angle: Float)
}

class BlueSelectorView: UIView {
    
    let view = UIView(frame: CGRect(x:50, y:50, width: 200, height: 200))
    private var _sliderPosition: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        
        //        let colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.cyan.cgColor, UIColor.blue.cgColor, UIColor.magenta.cgColor]
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let colors = [CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.0,0.0,0.0]), UIColor.blue.cgColor]
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: nil)
        context.drawLinearGradient(gradient!, start: CGPoint(x:0.0,y:20.0), end: CGPoint(x:250, y:20.0), options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
        // Add border rectangle
        context.addRect(CGRect(x:0.0, y:0.0, width:250, height:50))
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        // Add slider
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(3.0)
        context.move(to: CGPoint(x:sliderPosition, y:0.0))
        context.addLine(to: CGPoint(x:sliderPosition, y:(bounds.height / 2) - 5))
        context.move(to: CGPoint(x:sliderPosition, y:(bounds.height / 2) + 5))
        context.addLine(to: CGPoint(x:sliderPosition, y:bounds.height))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        let ellipse: CGRect = CGRect(x: sliderPosition - 5.0, y: (bounds.height / 2) - 5, width: 10.0, height: 10.0)
        context.addEllipse(in: ellipse)
        context.setStrokeColor(UIColor.white.cgColor)
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
        sliderPosition = x
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
        sliderPosition = x
    }
    
    
    var sliderPosition: CGFloat {
        get {
            return _sliderPosition
        }
        set {
            _sliderPosition = newValue
            setNeedsDisplay()
        }
    }
}
