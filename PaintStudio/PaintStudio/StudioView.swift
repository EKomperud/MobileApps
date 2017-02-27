//
//  StudioView.swift
//  PaintStudio
//
//  Created by u0844210 on 2/18/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol StudioDelegate: class {
    func studio(studio: StudioView, painted stroke: Stroke)
    
    func created(studio: StudioView, withCanvas painting: Painting)
    
    func brushSelect(studio: StudioView)
    
    func saveAndExit(studio: StudioView)
    
    func delete(studio: StudioView)
}

class StudioView: UIView, CanvasDelegate {
    
    // Buttons
    var brushSelector: UIButton = UIButton()
    var backButton: UIButton = UIButton()
    var deleteButton: UIButton = UIButton()
    
    // Painting
    var paintingView: PaintingView = PaintingView()
    var index = 0
    
    // Current stroke
    var stroke = Stroke(W: 2.0, C: UIColor.white.cgColor, Join: CGLineJoin.round, Cap: CGLineCap.round)
    
    // Declare delegate
    var delegate: StudioDelegate! //= nil
    var recorded: Bool = false
    
    init() {
        super.init(frame: CGRect.zero)

        brushSelector.setTitle("Brush Selector", for: .normal)
        brushSelector.addTarget(self, action: #selector(brushSelect), for: .touchUpInside)
        
        backButton.setTitle("Save and Exit", for: .normal)
        backButton.addTarget(self, action: #selector(SaveAndExit), for: .touchUpInside)
        
        deleteButton.setTitle("Discard Painting", for: .normal)
        deleteButton.addTarget(self, action: #selector(DiscardPainting), for: .touchUpInside)
        
        paintingView.backgroundColor = UIColor.white
        
        self.addSubview(paintingView)
        self.addSubview(brushSelector)
        self.addSubview(backButton)
        self.addSubview(deleteButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect())
    }
    
    override func draw(_ rect: CGRect) {
        if !recorded {
            delegate?.created(studio: self, withCanvas: paintingView.painting)
            recorded = true
        }
    }
    
    override func layoutSubviews() {
        brushSelector.frame =  CGRect(x: self.frame.width / 2, y: 20, width: 120, height: 25)
        brushSelector.center = CGPoint(x: self.frame.width / 5, y: 80)
        
        backButton.frame =  CGRect(x: self.frame.width / 2, y: 20, width: 110, height: 25)
        backButton.center = CGPoint(x: self.frame.width / 2, y: 100)
        
        deleteButton.frame =  CGRect(x: self.frame.width / 2, y: 20, width: 135, height: 25)
        deleteButton.center = CGPoint(x: self.frame.width * (4 / 5), y: 120)
        
        paintingView.frame = CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height - 150)
    }
    
    func Painted(Canvas: PaintingView, painted: Stroke) {
        delegate?.studio(studio: self, painted: painted)
    }
    
    func brushSelect() {
        delegate?.brushSelect(studio: self)
    }
    
    func SaveAndExit() {
        delegate?.saveAndExit(studio: self)
    }
    
    func DiscardPainting() {
        delegate?.delete(studio: self)
    }
}
