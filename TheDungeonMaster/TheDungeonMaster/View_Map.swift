//
//  View_Map.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/30/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol MapViewDelegate: class {
    func presentSelectAlert(token: MonsterToken)
}

class MapView: UIView, TokenDelegate {
    
    var mapWidth: Double = 375.0
    var mapHeight: Double = 603.0
    var firstTime = true
    var tool = "select"
    var token: Monster?
    var tokens = Dictionary<String, Array<MonsterToken>>()
    var lastTouched: MonsterToken?
    var tags = 3000
    
    weak var delegate: MapViewDelegate?
    
    override func draw(_ rect: CGRect) {
        DrawGrid()
    }
    
    func DrawGrid() {
        self.frame = CGRect(x: 0.0, y: 0.0, width: mapWidth, height: mapHeight)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineCap(.square)
        context.setLineJoin(.miter)
        context.setLineWidth(1.0)
        
        var w: Double = 0.0
        var h: Double = 0.0
        while w < mapWidth
        {
            context.move(to: CGPoint(x: CGFloat(w), y: CGFloat(0.0)))
            context.addLine(to: CGPoint(x: CGFloat(w), y: CGFloat(mapHeight)))
            w += 100
        }
        context.move(to: CGPoint(x: CGFloat(mapWidth), y: CGFloat(0.0)))
        context.addLine(to: CGPoint(x: CGFloat(mapWidth), y: CGFloat(mapHeight)))
        while h < mapHeight
        {
            context.move(to: CGPoint(x: CGFloat(0.0), y: CGFloat(h)))
            context.addLine(to: CGPoint(x: CGFloat(mapWidth), y: CGFloat(h)))
            h += 100
        }
        context.move(to: CGPoint(x: CGFloat(0.0), y: CGFloat(mapHeight)))
        context.addLine(to: CGPoint(x: CGFloat(mapWidth), y: CGFloat(mapHeight)))
        context.drawPath(using: .stroke)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        //var modelPoint: CGPoint = CGPoint()
        if tool == "select"
        {
            
        }
        else if tool == "monster"
        {
            let mon = MonsterToken(frame: CGRect(x: touchPoint.x - 64, y: touchPoint.y - 64, width: 128, height: 128), monster: token!)
            mon.delegate = self
            mon.tag = tags
            tags += 1
            self.addSubview(mon)
        }
    }
    
    func touched(token: MonsterToken) {
        if tool == "select" {
            if lastTouched == nil {
                lastTouched = token
            }
            else if !(lastTouched?.isEqual(token))! {
                //lastTouched?.touched = false
                lastTouched = token
            }
            else {
                delegate?.presentSelectAlert(token: token)
            }
        }
    }
    
    func deleteToken(token: MonsterToken) {
        let tokenView = self.viewWithTag(token.tag)
        tokenView?.removeFromSuperview()
    }
}
