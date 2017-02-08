//
//  Vector.swift
//  InClassExamples
//
//  Created by u0844210 on 2/8/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import Foundation

class Vector {
    
    var _x: Float
    var _y: Float
    
    init (x: Float, y: Float) {
        _x = x
        _y = y
    }
    
    var magnitude: Float {
        get {
            return sqrt(_x * _x + _y * _y)
        }
    }
    
    func add (v: Vector) {
        _x += v._x
        _y += v._y
    }
    
    func scale (s: Float) {
        _x *= s
        _y *= s
    }
}
