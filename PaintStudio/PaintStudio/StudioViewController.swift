//
//  StudioViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/17/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class StudioViewController: UIViewController, StudioDelegate, BrushSelectorDelegate {
    var studioView = StudioView()
    var studioModel = PaintingCollection()
    let brushSelector = BrushSelectorViewController()

    
    override func loadView() {
        studioView.delegate = self
        brushSelector.delegate = self
        view = studioView
        self.title = "Studio"
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func studio(studio: StudioView, painted stroke: Stroke) {
        studioModel.collection[studio.index].AddStroke(stroke: stroke)
    }
    
    func created(studio: StudioView, withCanvas painting: Painting) {
        let index: Int = studioModel.count
        studioModel.AddPainting(p: painting)
        studioModel.collection[index].index = index
        studioView = studio
        studioView.index = index
    }
    
    func brushSelected(brushSelector: BrushSelectorViewController, withColor color: CGColor, andWidth width: Float, andLineJoin lj: CGLineJoin, andAlsoLineCap lc: CGLineCap) {
        studioView.color = color
        studioView.width = width
        studioView.lineJoin = lj
        studioView.lineCap = lc
    }
    
    func brushSelect(studio: StudioView) {
        navigationController?.pushViewController(brushSelector, animated: true)
    }

    
}
