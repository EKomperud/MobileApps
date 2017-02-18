//
//  PaintingCollection.swift
//  PaintStudio
//
//  Created by u0844210 on 2/17/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class PaintingCollection {
    
    // Array of paintings
    var collection = Array<Any>()
    
    
}

class Painting {
    // Array of strokes
    var strokes = Array<Stroke>()
    
    // Aspect ratio
    
    var strokeCount: Int {
        return strokes.count
    }
    
    // Add stroke
    
    // Remove stroke
}

class Stroke {
    // Array of points
    var points = Array<Point>()
    
    // Brush settings
    let width: Float
    let color: CGColor
    let lineJoin: CGLineJoin
    let lineCap: CGLineCap
    
    init (W: Float, C: CGColor, Join: CGLineJoin, Cap: CGLineCap) {
        width = W
        color = C
        lineJoin = Join
        lineCap = Cap
    }
    
    func AddPoint(X: Float, Y: Float) {
        let p = Point(X: X, Y: Y)
        points.append(p)
    }
}

class Point {
    let x: Float
    let y: Float
    
    init (X: Float, Y: Float) {
        x = X
        y = Y
    }
}
