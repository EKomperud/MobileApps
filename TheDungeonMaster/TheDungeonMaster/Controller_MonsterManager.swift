//
//  ViewController.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class MonsterManagerViewController: UIViewController {
    
    var Monsters = Array<Monster>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Monsters.append(Monster(name: "Aboleth", hp: 128, ac: 18, toHit: 7))
        (ToMonsterManual()).write(toFile: "/Users/Authenticated User/Desktop/Monsters.txt", atomically: true)
        let Monsters2: NSDictionary = NSDictionary(contentsOfFile: "/Users/Authenticated User/Desktop/Monsters.txt")!
        print(Monsters2["Aboleth"])
    }
    
}

extension MonsterManagerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Monsters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Monsters[indexPath.item]._Name
        return cell
    }
    
    func ToMonsterManual() -> NSDictionary {
        var MonsterManual = Dictionary<String, Any>()
        for Mon in Monsters {
            let Attributes = [Mon._HP, Mon._AC, Mon._ToHit, Mon._Str, Mon._Dex, Mon._Con, Mon._Int, Mon._Wis, Mon._Chr]
            MonsterManual[Mon._Name] = Attributes
        }
        return MonsterManual as NSDictionary
    }
    
    func ToMonstersArray(MonsterManual: NSDictionary) -> Array<Any> {
        for (Name, Attributes) in MonsterManual {
            //let Mon = Monster(name: Name as! String, hp: Attributes[0] as! Int, ac: Attributes[1], toHit: Attributes[2])
        }
        return Array<Any>()
    }
}
