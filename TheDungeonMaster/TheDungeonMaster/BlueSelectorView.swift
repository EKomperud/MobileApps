//
//  BlueSelectorView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/6/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class BlueSelectorView: UIView {
    
    let slider: ColorSelectorView = ColorSelectorView()
    
    init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 50))
        slider.frame = self.bounds
        slider.backgroundColor = UIColor.clear
        slider.color = "blue"
        self.addSubview(slider)
        bringSubview(toFront: slider)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        slider.frame = self.bounds
        slider.backgroundColor = UIColor.clear
        slider.color = "blue"
        self.addSubview(slider)
        bringSubview(toFront: slider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect())
        slider.frame = self.bounds
        slider.backgroundColor = UIColor.clear
        slider.color = "blue"
        self.addSubview(slider)
        bringSubview(toFront: slider)
    }
    
    override func draw(_ rect: CGRect) {
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.clear(bounds)
        
        // Add gradient
        let colors = [CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.0,0.0,0.0]), UIColor.blue.cgColor]
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: nil)
        context.drawLinearGradient(gradient!, start: CGPoint(x:0.0,y:20.0), end: CGPoint(x:250, y:20.0), options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
        // Add border rectangle
        context.addRect(CGRect(x:0.0, y:0.0, width:250, height:50))
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.drawPath(using: CGPathDrawingMode.stroke)
    }
}
