//
//  View_Map.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/30/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MapView: UIView {
    
    var mapWidth: Float = 750.0
    var mapHeight: Float = 1334.0
    
    override func draw(_ rect: CGRect) {
        DrawGrid()
    }
    
    func DrawGrid() {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.setLineCap(.square)
        context.setLineJoin(.miter)
        context.setLineWidth(1.0)
        
        var w: Float = 100
        var h: Float = 100
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
        
//        context.move(to: CGPoint(x: 100, y: 1.0))
//        context.addLine(to: CGPoint(x: 100, y: 250))

        context.drawPath(using: .stroke)
    }
}
