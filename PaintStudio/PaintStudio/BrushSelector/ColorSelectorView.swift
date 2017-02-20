//
//  ColorSelector.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol ColorSelectorDelegate: class {
    func colorSelector(colorSelector: ColorSelectorView, movedToValue value: CGFloat, asColor color: String)
}

class ColorSelectorView: UIView {
    
    let view = UIView()
    private var _sliderPosition: CGFloat = 0.0
    var ellipse = CGRect()
    var color: String = ""
    weak var delegate: ColorSelectorDelegate? = nil
    
    override func draw(_ rect: CGRect) {
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.clear(bounds)
        
        // Add slider
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineWidth(3.0)
        context.move(to: CGPoint(x:sliderPosition, y:0.0))
        context.addLine(to: CGPoint(x:sliderPosition, y:(bounds.height / 2) - 5))
        context.move(to: CGPoint(x:sliderPosition, y:(bounds.height / 2) + 5))
        context.addLine(to: CGPoint(x:sliderPosition, y:bounds.height))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        ellipse = CGRect(x: sliderPosition - 5.0, y: (bounds.height / 2) - 5, width: 10.0, height: 10.0)
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
        
        let X = x / bounds.width
        
        delegate?.colorSelector(colorSelector: self, movedToValue: X, asColor: color)
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
        
        let X = x / bounds.width
        
        delegate?.colorSelector(colorSelector: self, movedToValue: X, asColor: color)
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
