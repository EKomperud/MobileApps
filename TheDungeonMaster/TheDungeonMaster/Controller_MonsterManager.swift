//
//  ViewController.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MonsterManagerViewController: UIViewController, MonsterMakerDelegate {
    
    var Monsters = Array<Monster>()
    
    var makerController = MonsterMakerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Monsters.append(Monster(name: "Aboleth", hp: 128, ac: 18, prof: 7))
        (ToMonsterManual()).write(toFile: "/Users/Authenticated User/Desktop/Monsters.txt", atomically: true)
        let Monsters2: NSDictionary = NSDictionary(contentsOfFile: "/Users/Authenticated User/Desktop/Monsters.txt")!
        print(Monsters2["Aboleth"]!)
        
        makerController.delegate = self
    }
    
    func SaveToManager(monster: Monster) {
        Monsters.append(monster)
    }
    
}

extension MonsterManagerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Monsters.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item < Monsters.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Monster")
            cell?.textLabel?.text = Monsters[indexPath.item]._Name
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "+")
            return cell!
        }
    }
    
    // Convert Monsters to Dictionary to store in memory
    func ToMonsterManual() -> NSDictionary {
        var MonsterManual = Dictionary<String, Array<Int>>()
        for Mon in Monsters {
            let Attributes = [Mon._HP, Mon._AC, Mon._Prof, Mon._Str, Mon._Dex, Mon._Con, Mon._Int, Mon._Wis, Mon._Chr]
            MonsterManual[Mon._Name] = Attributes
        }
        return MonsterManual as NSDictionary
    }
    
    // Convert memory to Monsters array
    func ToMonstersArray(MonsterManual: NSDictionary) -> Array<Monster> {
        var MonstersArray = Array<Monster>()
        for (Name, Attributes) in MonsterManual {
            let AttributesArray = Attributes as! Array<Int>
            let Mon = Monster(name: Name as! String, hp: AttributesArray[0], ac: AttributesArray[1], prof: AttributesArray[2])
            Mon._Str = AttributesArray[3]
            Mon._Dex = AttributesArray[4]
            Mon._Con = AttributesArray[5]
            Mon._Int = AttributesArray[6]
            Mon._Wis = AttributesArray[7]
            Mon._Chr = AttributesArray[8]
            MonstersArray.append(Mon)
        }
        return MonstersArray
    }
}
