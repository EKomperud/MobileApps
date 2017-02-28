//
//  PaintingPreview.swift
//  PaintStudio
//
//  Created by u0844210 on 2/27/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class PaintingPreview: UICollectionViewCell {
    
    var _painting = Painting(AspectX: 200, AspectY: 100)
    
    var _aspectX: CGFloat {
        return _painting.aspectX / 5
    }
    
    var _aspectY: CGFloat {
        return _painting.aspectY / 5
    }
    
    func Load(Painting painting: Painting) {
        _painting = painting
    }
 
    override func draw(_ rect: CGRect) {
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        for s in _painting.strokes {
            context.setStrokeColor(s.color)
            context.setLineCap(s.lineCap)
            context.setLineJoin(s.lineJoin)
            context.setLineWidth(CGFloat(s.width / 5))
            context.move(to: CGPoint(x: CGFloat((s.points.first?.x)!) * _aspectX, y: CGFloat((s.points.first?.y)!) * _aspectY))
            for point in s.points {
                context.addLine(to: CGPoint(x: CGFloat(point.x) * _aspectX, y: CGFloat(point.y) * _aspectY))
            }
            context.drawPath(using: .stroke)
        }

        context.drawPath(using: CGPathDrawingMode.stroke)
    }
    
}
