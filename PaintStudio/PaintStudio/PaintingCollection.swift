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
    var collection = Array<Painting>()
    var count: Int {
        return collection.count
    }
    
    func AddPainting(p: Painting) {
        collection.append(p)
    }
    
    func RemovePainting(index: Int) {
        collection.remove(at: index)
    }
    
    func GetPainting(index: Int) -> Painting {
        return collection[index]
    }
}

class Painting {
    
    // Array of strokes
    var strokes = Array<Stroke>()
    
    // Aspect ratio
    let aspectX: Int
    let aspectY: Int
    
    // Index
    var index: Int = 0
    
    init(AspectX: Int, AspectY: Int) {
        aspectX = AspectX
        aspectY = AspectY
    }
    
    // Stroke count
    var strokeCount: Int {
        return strokes.count
    }
    
    // Add stroke
    func AddStroke(stroke: Stroke) {
        strokes.append(stroke)
    }
    
    // Remove stroke
    func RemoveStroke() {
        strokes.remove(at: strokes.count - 1)
    }
    
    // Get strokes
    func GetStrokes() -> Array<Stroke> {
        return strokes
    }
    
    // Get most recent stroke
    func GetLastStroke() -> Stroke? {
        return strokes.last
    }
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
    
    func IsEmpty() -> Bool {
        return points.isEmpty
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
