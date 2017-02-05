//
//  MainView.swift
//  BrushSelector
//
//  Created by u0844210 on 2/4/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let view = UIView(frame: CGRect(x:50, y:50, width: 200, height: 100))
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.addLine(to: CGPoint(x: 25, y: 25))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.purple.cgColor, UIColor.red.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func createGradientLayer() {
//        var gradientlayer = CAGradientLayer()
//        gradientlayer.frame = self.bounds
//        gradientlayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
    }
}
