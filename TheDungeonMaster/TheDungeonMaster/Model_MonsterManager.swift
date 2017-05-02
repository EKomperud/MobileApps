//
//  Model_MonsterManager.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class Monster {
    var _Name: String
    
    var _HP: Int
    var _AC: Int
    var _Prof: Int
    
    var _Str: Int = 0
    var _Dex: Int = 0
    var _Con: Int = 0
    var _Int: Int = 0
    var _Wis: Int = 0
    var _Chr: Int = 0
    
    var _Saves: Array = [false,false,false,false,false,false]
    
    var _Portrait: UIImage?
    
    init(name: String, hp: Int, ac: Int, prof: Int) {
        _Name = name; _HP = hp; _AC = ac; _Prof = prof
    }
    
    func Stats(str: Int, dex: Int, con: Int, int: Int, wis: Int, chr: Int) {
        _Str = str; _Dex = dex; _Con = con; _Int = int; _Wis = wis; _Chr = chr
    }
    
    func Saves(str: Bool, dex: Bool, con: Bool, int: Bool, wis: Bool, chr: Bool) {
        _Saves[0] = str
        _Saves[1] = dex
        _Saves[2] = con
        _Saves[3] = int
        _Saves[4] = wis
        _Saves[5] = chr
    }
    
    func Portrait(p: UIImage) {
        _Portrait = p
    }
    
    func PortraitToPNG() -> NSData {
        let image: NSData = UIImagePNGRepresentation(_Portrait!)! as NSData
        return image
    }

    func PNGToPortrait(d: NSData) -> UIImage {
        let portrait = UIImage(data: d as Data)
        _Portrait = portrait
        return portrait!
    }
    
    func GetSave(stat: String) -> Int {
        let s = stat.lowercased()
        switch s {
            case "str", "strength": return _Str + (_Saves[0] ? _Prof : 0)
            case "dex", "dexterity": return _Dex + (_Saves[0] ? _Prof : 0)
            case "con", "constitution": return _Con + (_Saves[0] ? _Prof : 0)
            case "int", "intelligence": return _Int + (_Saves[0] ? _Prof : 0)
            case "wis", "wisdom": return _Wis + (_Saves[0] ? _Prof : 0)
            case "chr", "charisma": return _Chr + (_Saves[0] ? _Prof : 0)
        default: return 0
        }
    }
}
