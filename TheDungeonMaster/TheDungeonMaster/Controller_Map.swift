//
//  Controller_Map.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/30/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    var _width:  Double = 750.0
    var _height: Double = 1334.0
    
    @IBOutlet weak var map: MapView?
    @IBOutlet weak var scroll: UIScrollView?
    
    override func viewDidLoad() {
        
        let alertController = UIAlertController(title: "New Map", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField) in
            textField.delegate = self
            textField.tag = 0
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = "Enter Map Width (default: 750)"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.delegate = self
            textField.tag = 0
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = "Enter Map Height (default: 1334)"
        }
        
        let newMapAction = UIAlertAction(title: "Create Map", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            if firstTextField.text! != "" {
                self._width = Double(firstTextField.text!)!
            }
            else {self._width = 750}
            
            let secondTextField = alertController.textFields![1] as UITextField
            if secondTextField.text! != "" {
                self._height = Double(secondTextField.text!)!
            }
            else {self._height = 1334}
            
            self.map?.mapWidth = self._width
            self.map?.mapHeight = self._height
            self.map?.bounds = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.frame = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.setNeedsDisplay()
            
            self.scroll?.bounds = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.scroll?.frame = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.scroll?.contentSize = CGSize(width: self._width, height: self._height)
            self.scroll?.setNeedsDisplay()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addAction(newMapAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scroll?.contentSize = CGSize(width: _width, height: _height)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool {
        if (textField.tag == 1) {
            return true
        }
        if (string.characters.count == 0) {
            return true;
        }
        return Int(string) != nil
    }
}
