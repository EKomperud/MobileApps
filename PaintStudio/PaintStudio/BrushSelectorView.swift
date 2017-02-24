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
    var width: Float = 2.0
    var color: CGColor = UIColor.white.cgColor
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    
    // Subviews
    let title: UILabel = UILabel()
    let redSelector = RedSelectorView()
    let greenSelector = GreenSelectorView()
    let blueSelector = BlueSelectorView()
    let widthSelector = UISlider()
    let joinSelector = BrushJoinView()
    let capSelector = BrushCapView()
    let brushExample = BrushExampleView()
    
    init() {
        super.init(frame: CGRect(x:0.0, y:0.0, width:200, height: 300))
        
        let title: UILabel = UILabel(frame: CGRect(x: frame.width / 2 - 125, y: 20.0, width: 250, height: 50))
        title.text = "Brush Selector"
        title.textColor = UIColor.white
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: "AmericanTypewriter", size: 30)
        
        let backButton = UIButton()
        
        widthSelector.minimumValue = 0.5
        widthSelector.maximumValue = 50.0
        widthSelector.addTarget(self, action: #selector(widthSliderChanged), for: UIControlEvents.valueChanged)
        

        
        brushExample.frame = CGRect(x: frame.width / 2, y: frame.height - 140, width:300, height: 140)
        brushExample.backgroundColor = UIColor.clear
        
        self.addSubview(title)          // 0
        self.addSubview(backButton)     // 1
        self.addSubview(redSelector)    // 2
        self.addSubview(greenSelector)  // 3
        self.addSubview(blueSelector)   // 4
        self.addSubview(widthSelector)  // 5
        self.addSubview(joinSelector)   // 6
        self.addSubview(capSelector)    // 7
        self.addSubview(brushExample)   // 8
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect())
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.white.cgColor)
        context.move(to: CGPoint(x:0.0, y:0.0))
        context.addLine(to: CGPoint(x:0.0, y:frame.height))
        context.drawPath(using: .stroke)
    }
    
    override func layoutSubviews() {
//        var r: CGRect = bounds
//        (title.frame, r) = r.divided(atDistance: r.height * 0.2, from: .minYEdge)
//        (redSelector.frame, r) = r.divided(atDistance: r.height * 0.25, from: .minYEdge)
//        (greenSelector.frame, r) = r.divided(atDistance: r.height * 0.333, from: .minYEdge)
//        (blueSelector.frame, r) = r.divided(atDistance: r.height * 0.5, from: .minYEdge)
//        (widthSelector.frame, r) = r.divided(atDistance: r.height * 1, from: .minYEdge)
        if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            redSelector.frame = CGRect(x: bounds.width / 2, y: 90.0, width: 250, height: 50)
            redSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.10 + 35)
            
            greenSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            greenSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.2 + 35)
            
            blueSelector.frame = CGRect(x: frame.width / 2, y: 160.0, width: 250, height: 50)
            blueSelector.center = CGPoint(x: self.frame.width / 2 , y: self.frame.height * 0.3 + 35)
            
            widthSelector.frame = CGRect(x: 40, y: (frame.height / 2) + 20, width: 250, height: 30)
            widthSelector.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.4 + 35)
            
            joinSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 160, width: 250, height: 60)
            joinSelector.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.5 + 35)
            
            capSelector.frame = CGRect(x: frame.width / 2, y: (frame.height / 2) + 70, width: 250, height: 60)
            capSelector.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.625 + 35)
        }
        else {
            
        }
    }
    
    func widthSliderChanged (sender: UISlider) {
        width = sender.value
    }
    
    
}