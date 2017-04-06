//
//  Model_MonsterManager.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import Foundation

class Monster {
    var _Name: String
    
    var _HP: Int
    var _AC: Int
    var _ToHit: Int
    
    var _Str: Int = 0
    var _Dex: Int = 0
    var _Con: Int = 0
    var _Int: Int = 0
    var _Wis: Int = 0
    var _Chr: Int = 0
    
    init(name: String, hp: Int, ac: Int, toHit: Int) {
        _Name = name; _HP = hp; _AC = ac; _ToHit = toHit
    }
    
    func SavingThrows(str: Int, dex: Int, con: Int, int: Int, wis: Int, chr: Int) {
        _Str = str; _Dex = dex; _Con = con; _Int = int; _Wis = wis; _Chr = chr
    }
}
