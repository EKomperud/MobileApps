//
//  ViewController.swift
//  BrushSelector
//
//  Created by u0844210 on 2/4/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        createGradientLayer()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createGradientLayer() {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.bounds
        gradientlayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        self.view.layer.addSublayer(gradientlayer)
    }
}

