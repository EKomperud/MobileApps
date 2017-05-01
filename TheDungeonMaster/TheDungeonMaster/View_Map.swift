//
//  View_Map.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/30/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MapView: UIView {
    
    var mapWidth: Double = 375.0
    var mapHeight: Double = 603.0
    
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
        while h < mapHeight
        {
            context.move(to: CGPoint(x: CGFloat(0.0), y: CGFloat(h)))
            context.addLine(to: CGPoint(x: CGFloat(mapWidth), y: CGFloat(h)))
            h += 100
        }

        context.drawPath(using: .stroke)
    }
    
}
