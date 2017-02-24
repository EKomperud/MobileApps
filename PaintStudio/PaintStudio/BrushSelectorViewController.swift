//
//  BrushSelectorViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/19/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol BrushSelectorDelegate: class {
    func brushSelected(brushSelector: BrushSelectorViewController, withColor color: CGColor, andWidth width: Float, andLineJoin lj: CGLineJoin, andAlsoLineCap lc: CGLineCap)
}

class BrushSelectorViewController: UIViewController, UINavigationControllerDelegate, ColorSelectorDelegate, BrushJoinDelegate, BrushCapDelegate {
    
    var selectorView = BrushSelectorView()
    
    var isPortrait: Bool = true
    
    var _red: CGFloat = 1.0
    var _green: CGFloat = 1.0
    var _blue: CGFloat = 1.0
    var width: Float = 2.0
    var lineJoin: CGLineJoin = CGLineJoin.round
    var lineCap: CGLineCap = CGLineCap.round
    var delegate: BrushSelectorDelegate? = nil
    
    override func loadView() {
        let redSubView: ColorSelectorView = selectorView.subviews[2].subviews[0] as! ColorSelectorView
        redSubView.delegate = self
        
        let greenSubView: ColorSelectorView = selectorView.subviews[3].subviews[0] as! ColorSelectorView
        greenSubView.delegate = self
        
        let blueSubView: ColorSelectorView = selectorView.subviews[4].subviews[0] as! ColorSelectorView
        blueSubView.delegate = self
        
        let brushJoinSubView: BrushJoinView = selectorView.subviews[6] as! BrushJoinView
        brushJoinSubView.delegate = self
        
        let brushCapSubView: BrushCapView = selectorView.subviews[7] as! BrushCapView
        brushCapSubView.delegate = self
        
        view = selectorView
        
        self.title = "Brush Selector"
    }
    
    override func viewDidLoad() {
        isPortrait = UIDevice.current.orientation.isPortrait
    }
    
    func colorSelector(colorSelector: ColorSelectorView, movedToValue value: CGFloat, asColor color: String) {
        if (color == "red") {
            _red = value
        }
        if (color == "green") {
            _green = value
        }
        if (color == "blue") {
            _blue = value
        }
        let newColor: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [_red,_green,_blue,1.0])!
        delegate?.brushSelected(brushSelector: self, withColor: newColor, andWidth: width, andLineJoin: lineJoin, andAlsoLineCap: lineCap)
    }
    
    func brushCap(brushCap: BrushCapView, StylePicked style: CGLineCap) {
        lineCap = style
        let color: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [_red,_green,_blue,1.0])!
        delegate?.brushSelected(brushSelector: self, withColor: color, andWidth: width, andLineJoin: lineJoin, andAlsoLineCap: lineCap)
    }
    
    func brushJoin(brushJoin: BrushJoinView, StylePicked style: CGLineJoin) {
        lineJoin = style
        let color: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [_red,_green,_blue,1.0])!
        delegate?.brushSelected(brushSelector: self, withColor: color, andWidth: width, andLineJoin: lineJoin, andAlsoLineCap: lineCap)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isPortrait {
            isPortrait = true
        }
        else {
            isPortrait = false
        }
    }
}
