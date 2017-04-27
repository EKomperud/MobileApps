//
//  Controller_MonsterMaker.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/12/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol MonsterMakerDelegate: class {
    func SaveToManager(monster: Monster)
}

class MonsterMakerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var MonsterNameField: UITextField!
    @IBOutlet weak var MonsterHP: UITextField!
    @IBOutlet weak var MonsterAC: UITextField!
    @IBOutlet weak var MonsterProficiency: UITextField!
    
    @IBOutlet weak var MonsterStr: UITextField!
    @IBOutlet weak var MonsterDex: UITextField!
    @IBOutlet weak var MonsterCon: UITextField!
    @IBOutlet weak var MonsterInt: UITextField!
    @IBOutlet weak var MonsterWis: UITextField!
    @IBOutlet weak var MonsterChr: UITextField!
    
    @IBOutlet weak var MonsterStrSave: UISwitch!
    @IBOutlet weak var MonsterDexSave: UISwitch!
    @IBOutlet weak var MonsterConSave: UISwitch!
    @IBOutlet weak var MonsterIntSave: UISwitch!
    @IBOutlet weak var MonsterWisSave: UISwitch!
    @IBOutlet weak var MonsterChrSave: UISwitch!
    
    @IBOutlet weak var SaveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(MonsterMakerViewController.Save))
    
    var delegate: MonsterMakerDelegate? = nil
    
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MonsterNameField.delegate = self
        MonsterHP.delegate = self
        MonsterAC.delegate = self
        MonsterProficiency.delegate = self
        MonsterStr.delegate = self
        MonsterDex.delegate = self
        MonsterCon.delegate = self
        MonsterInt.delegate = self
        MonsterWis.delegate = self
        MonsterChr.delegate = self
        
        SaveButton?.action = #selector(MonsterMakerViewController.Save)
        
        AddDoneButton()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.tag != 1 && textField.text == "") {
            textField.text = textField.placeholder
        }
    }
    
    func AddDoneButton() {
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: 320.0, height: 50.0))
        toolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(MonsterMakerViewController.Done))
        
        toolbar.items = [flexSpace, doneButton]
        toolbar.sizeToFit()
        
        MonsterHP.inputAccessoryView = toolbar
        MonsterAC.inputAccessoryView = toolbar
        MonsterProficiency.inputAccessoryView = toolbar
        MonsterStr.inputAccessoryView = toolbar
        MonsterDex.inputAccessoryView = toolbar
        MonsterCon.inputAccessoryView = toolbar
        MonsterInt.inputAccessoryView = toolbar
        MonsterWis.inputAccessoryView = toolbar
        MonsterChr.inputAccessoryView = toolbar
    }
    
    @ IBAction func Save() {
        if (MonsterNameField.text != "") {
            let alert: UIAlertController = UIAlertController(title: "Saved!", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Saved!")}))
            let m: Monster = Monster(name: MonsterNameField.text!, hp: Int(MonsterHP.text!)!, ac: Int(MonsterAC.text!)!, prof: Int(MonsterProficiency.text!)!)
            m.Stats(str: Int(MonsterStr.text!)!, dex: Int(MonsterDex.text!)!, con: Int(MonsterCon.text!)!, int: Int(MonsterInt.text!)!, wis: Int(MonsterWis.text!)!, chr: Int(MonsterChr.text!)!)
            m.Saves(str: MonsterStrSave.isOn, dex: MonsterDexSave.isOn, con: MonsterConSave.isOn, int: MonsterIntSave.isOn, wis: MonsterWisSave.isOn, chr: MonsterChrSave.isOn)
            delegate?.SaveToManager(monster: m)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert: UIAlertController = UIAlertController(title: "You must add a Monster name before saving", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in print("Saved!")}))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func Done() {
        activeTextField.resignFirstResponder()
    }
    
}
