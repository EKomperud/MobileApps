//
//  MainView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/4/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let view = UIView(frame: CGRect(x:50, y:50, width: 200, height: 200))
    
    override func draw(_ rect: CGRect) {
        //let gradientRect: CGRect = CGRect(x: 0.0, y:0.0, width: 200, height: 50)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!

        
        let colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        //let colorsArray = CFArray(colors)
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: nil)
        //gradient
        
        context.drawLinearGradient(gradient!, start: CGPoint(x:0.0,y:20.0), end: CGPoint(x:250.0, y:20.0), options: CGGradientDrawingOptions.drawsAfterEndLocation)
        context.addRect(CGRect(x:0.0, y:0.0, width:250, height:50))
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        context.drawPath(using: CGPathDrawingMode.stroke)
        
//        let gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.purple.cgColor, UIColor.red.cgColor]
        
        //view.layer.addSublayer(gradient)
    }
    
    func createGradientLayer() {
//        var gradientlayer = CAGradientLayer()
//        gradientlayer.frame = self.bounds
//        gradientlayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
    }
}
