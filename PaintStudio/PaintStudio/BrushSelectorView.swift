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
    
    init() {
        super.init(frame: CGRect())
        
        let title: UILabel = UILabel(frame: CGRect(x: frame.width / 2 - 125, y: 20.0, width: 250, height: 50))
        title.text = "Brush Selector"
        title.textColor = UIColor.white
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: "AmericanTypewriter", size: 30)
        
        let backButton = UIButton()
        backButton.setTitle("Fuck", for: .normal)

        let redSelector = RedSelectorView()
        redSelector.frame = CGRect(x: frame.width / 2 - 125, y: 90.0, width: 250, height: 50)
        
        let greenSelector = GreenSelectorView()
        greenSelector.frame = CGRect(x: frame.width / 2 - 125, y: 160.0, width: 250, height: 50)
        
        let blueSelector = BlueSelectorView()
        blueSelector.frame = CGRect(x: frame.width / 2 - 125, y: 230.0, width: 250, height: 50)
        
        let widthSelector = UISlider()
        widthSelector.frame = CGRect(x: 40, y: (frame.height / 2) + 20, width: frame.width - 80, height: 30)
        widthSelector.minimumValue = 0.5
        widthSelector.maximumValue = 50.0
        widthSelector.addTarget(self, action: #selector(widthSliderChanged), for: UIControlEvents.valueChanged)
        
        let joinSelector = BrushJoinView()
        joinSelector.frame = CGRect(x: frame.width / 2 - 125, y: (frame.height / 2) + 160, width: 250, height: 60)
        
        let capSelector = BrushCapView()
        capSelector.frame = CGRect(x: frame.width / 2 - 125, y: (frame.height / 2) + 70, width: 250, height: 60)
        
        let brushExample = BrushExampleView()
        brushExample.frame = CGRect(x: frame.width / 2 - 150, y: frame.height - 140, width:300, height: 140)
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
        
    }
    
    func widthSliderChanged (sender: UISlider) {
        width = sender.value
    }
}
