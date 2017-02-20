//
//  StudioViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/17/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class StudioViewController: UIViewController, StudioDelegate {
    var studioView = StudioView()
    var studioModel = Painting(AspectX: 100, AspectY: 100)
    
    override func loadView() {
        view = studioView
        studioView.delegate = self
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func studio(studio: StudioView, painted stroke: Stroke) {
        studioModel.AddStroke(stroke: stroke)
    }
}
