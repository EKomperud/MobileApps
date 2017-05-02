//
//  BrushSelectorView.swift
//  PaintStudio
//
//  Created by u0844210 on 2/19/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class BrushSelectorView: UIView {
    
    // Brush settings
    var width: Float = 1.0
    var color: CGColor = UIColor.white.cgColor
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    
    // Subviews
    let title: UILabel = UILabel()
    let redSelector = RedSelectorView()
    let greenSelector = GreenSelectorView()
    let blueSelector = BlueSelectorView()
    let widthPlaceholder = UILabel()
    let joinSelector = BrushJoinView()
    let capSelector = BrushCapView()
    let brushExample = BrushExampleView()
    
    init() {
        super.init(frame: CGRect(x:0.0, y:0.0, width:200, height: 300))
        
        let backButton = UIButton()
        
        brushExample.backgroundColor = UIColor.clear
        
        widthPlaceholder.text = ""
        
        self.addSubview(title)          // 0
        self.addSubview(backButton)     // 1
        self.addSubview(redSelector)    // 2
        self.addSubview(greenSelector)  // 3
        self.addSubview(blueSelector)   // 4
        self.addSubview(widthPlaceholder)  // 5
        self.addSubview(joinSelector)   // 6
        self.addSubview(capSelector)    // 7
        self.addSubview(brushExample)   // 8
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect())
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.white.cgColor)
        context.move(to: CGPoint(x:0.0, y:0.0))
        context.addLine(to: CGPoint(x:0.0, y:frame.height))
        context.drawPath(using: .stroke)
    }
    
    override func layoutSubviews() {
        if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            redSelector.frame = CGRect(x: bounds.width / 2, y: 90.0, width: 250, height: 50)
            redSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.10 + 35)
            
            greenSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            greenSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.2 + 35)
            
            blueSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            blueSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.3 + 35)
            
            joinSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 160, width: 250, height: 60)
            joinSelector.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.5 + 35)
            
            capSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 70, width: 250, height: 60)
            capSelector.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.625 + 35)
            
            brushExample.frame = CGRect(x: frame.width / 2, y: frame.height - 140, width:300, height: 140)
            brushExample.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.85 + 35)
        }
        else {
            redSelector.frame = CGRect(x: bounds.width / 2, y: 90.0, width: 250, height: 50)
            redSelector.center = CGPoint(x: self.frame.width / 4 , y: self.frame.height * 0.2 + 20)
            
            greenSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            greenSelector.center = CGPoint(x: self.frame.width / 4 , y: self.frame.height * 0.4 + 20)
            
            blueSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            blueSelector.center = CGPoint(x: self.frame.width / 4 , y: self.frame.height * 0.6 + 20)
            
            joinSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 160, width: 250, height: 60)
            joinSelector.center = CGPoint(x: self.frame.width * 0.75 , y: self.frame.height * 0.25 + 20)
            
            capSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 70, width: 250, height: 60)
            capSelector.center = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.5 + 20)
            
            brushExample.frame = CGRect(x: frame.width / 2, y: frame.height - 140, width:300, height: 140)
            brushExample.center = CGPoint(x: self.frame.width * 0.75, y: self.frame.height * 0.75 + 20)
        }
    }
    
}
