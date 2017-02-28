//
//  StudioViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/17/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol StudioControllerDelegate: class {
    func PassOffToCollection(deleted: Bool, i: Int)
    
    func SendAspect(i: Int, x: CGFloat, y: CGFloat)
    
    func Created(studio: StudioView, withCanvas painting: Painting)
    
    func Painted(studio: StudioView, stroke: Stroke)
}

class StudioViewController: UIViewController, StudioDelegate, BrushSelectorDelegate {
    
    var studioView = StudioView()
    var studioModel = PaintingCollection()
    let brushSelector = BrushSelectorViewController()
    
    var delegate: StudioControllerDelegate? = nil

    override func loadView() {
        studioView.delegate = self
        brushSelector.delegate = self
        view = studioView
        self.title = "Studio"
    }
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func studio(studio: StudioView, painted stroke: Stroke) {
        delegate?.Painted(studio: studio, stroke: stroke)
    }
    
    func sendAspect(i: Int, x: CGFloat, y: CGFloat) {
        delegate?.SendAspect(i: i, x: x, y: y)
    }
    
    func created(studio: StudioView, withCanvas painting: Painting) {
        delegate?.Created(studio: studio, withCanvas: painting)
    }
    
    func brushSelected(brushSelector: BrushSelectorViewController, withColor color: CGColor, andWidth width: Float, andLineJoin lj: CGLineJoin, andAlsoLineCap lc: CGLineCap) {
        studioView.paintingView.color = color
        studioView.paintingView.width = width
        studioView.paintingView.lineJoin = lj
        studioView.paintingView.lineCap = lc
    }
    
    func brushSelect(studio: StudioView) {
        navigationController?.pushViewController(brushSelector, animated: true)
    }

    func saveAndExit(i: Int) {
        delegate?.PassOffToCollection(deleted: false, i: i)
    }
    
    func delete(i: Int) {
        delegate?.PassOffToCollection(deleted: true, i: i)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        view.setNeedsDisplay()
        for v in view.subviews {
            v.setNeedsDisplay()
        }
    }
    
}
