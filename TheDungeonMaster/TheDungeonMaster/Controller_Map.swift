//
//  Controller_Map.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/30/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITextFieldDelegate, MapViewDelegate {
    
    var _width:  Double = 750.0
    var _height: Double = 1334.0
    var _monster: Monster?
    //var _tokens = Dictionary<String, MonsterToken>()
    
    @IBOutlet weak var map: MapView?
    @IBOutlet weak var scroll: UIScrollView?
    @IBOutlet weak var tools: UIToolbar?
    
    override func viewDidLoad() {
        
        let alertController = UIAlertController(title: "New Map", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let screenSize = UIScreen.main.bounds
        let navigationBarHeight = self.navigationController!.navigationBar.frame.height
        let toolbarHeight = self.tools?.frame.height
        let screenWidth = Double(screenSize.width)
        let screenHeight = Double(screenSize.height - navigationBarHeight - toolbarHeight!)
        alertController.addTextField { (textField) in
            textField.delegate = self
            textField.tag = 0
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = "Enter Map Width (default: \(screenWidth))"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.delegate = self
            textField.tag = 0
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = "Enter Map Height (default: \(screenHeight))"
        }
        
        let newMapAction = UIAlertAction(title: "Create Map", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            if firstTextField.text! != "" {
                self._width = Double(firstTextField.text!)!
            }
            else {self._width = screenWidth}
            
            let secondTextField = alertController.textFields![1] as UITextField
            if secondTextField.text! != "" {
                self._height = Double(secondTextField.text!)!
            }
            else {self._height = screenHeight}
            
            self.map?.mapWidth = self._width
            self.map?.mapHeight = self._height
            self.map?.bounds = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.frame = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.setNeedsDisplay()
            
            self.scroll?.contentSize = CGSize(width: self._width, height: self._height)
            self.scroll?.setNeedsDisplay()
        })
        
        let cancelAction = UIAlertAction(title: "Default", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            self._width = screenWidth
            self._height = screenHeight
            
            self.map?.mapWidth = self._width
            self.map?.mapHeight = self._height
            self.map?.bounds = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.frame = CGRect(x: 0.0, y: 0.0, width: self._width, height: self._height)
            self.map?.setNeedsDisplay()
            
            self.scroll?.contentSize = CGSize(width: self._width, height: self._height)
            self.scroll?.setNeedsDisplay()
        })
        
        alertController.addAction(newMapAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        map?.delegate = self
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? MonsterManagerViewController {
            map?.tool = "monster picker"
        }
    }
    
    func chooseMonster(monster: Monster) {
        _monster = monster
    }
    
    @IBAction func unwindToMap(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func placeMonster() {
        map?.token = _monster
        map?.tool = "monster"
    }
    
    @IBAction func selectTool() {
        map?.tool = "select"
    }
    
    func presentSelectAlert(token: MonsterToken) {
        let alert: UIAlertController = UIAlertController(title: "Delete Token?", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.map?.deleteToken(token: token)}))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
