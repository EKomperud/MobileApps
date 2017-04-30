//
//  ViewController.swift
//  TheDungeonMaster
//
//  Created by u0844210 on 4/5/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit
import CoreData

class MonsterManagerViewController: UIViewController, MonsterMakerDelegate {
    
    // A dictionary of all Monsters, mapped by name.
    // NOTE: No two monsters with the same name may exist
    var _Monsters = Dictionary<String, Monster>()
    
    // A sorted array of all Monster names
    var MonsterNames: Array<String> {
        return _Monsters.keys.sorted()
    }
    
    // Holds a single monster object for data passing purposes
    var MonsterData: Monster = Monster(name: "", hp: 10, ac: 10, prof: 10)
    
    // CoreData context
    var context: NSManagedObjectContext? = nil
    
    // The table view
    @IBOutlet var monsterTable: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        // Detect first time launch
        let appHasBeenLaunched = UserDefaults.standard.bool(forKey: "appHasBeenLaunched")
        if !appHasBeenLaunched {
            // Write data locally
            let Aboleth = Monster(name: "Aboleth", hp: 135, ac: 17, prof: 4)
            Aboleth.Stats(str: 21, dex: 9, con: 15, int: 18, wis: 15, chr: 18)
            Aboleth.Saves(str: false, dex: false, con: true, int: true, wis: true, chr: false)
            _Monsters.updateValue(Aboleth, forKey: "Aboleth")
            
            saveMonsterToData(monster: Aboleth)
            do
            {
                try context?.save()
                UserDefaults.standard.set(true, forKey: "appHasBeenLaunched")
            }
            catch
            {
                // Error
            }
        }
            
        else
        {
            loadMonstersFromData()
        }
        
//        deleteAllData(entity: "Monster")
//        UserDefaults.standard.set(false, forKey: "appHasBeenLaunched")
    }
    
    func SaveToManager(monster: Monster) {
        _Monsters.updateValue(monster, forKey: monster._Name)
        saveMonsterToData(monster: monster)
        monsterTable?.reloadData()
    }
    
    func ArrayToMonster(m: NSArray) -> Monster {
        let monster = Monster(name: m[0] as! String, hp: m[1] as! Int, ac: m[2] as! Int, prof: m[3] as! Int)
        monster.Stats(str: m[4] as! Int, dex: m[5] as! Int, con: m[6] as! Int, int: m[7] as! Int, wis: m[8] as! Int, chr: m[9] as! Int)
        let saves = m[10] as! Array<Bool>
        monster.Saves(str: saves[0], dex: saves[1], con: saves[2], int: saves[3], wis: saves[4], chr: saves[5])
        return monster
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? MonsterMakerViewController {
            let indexPath: IndexPath = monsterTable!.indexPathForSelectedRow!
            let cell: UITableViewCell = monsterTable!.cellForRow(at: indexPath)!
            if (cell.reuseIdentifier == "Monster") {
                MonsterData = _Monsters[MonsterNames[indexPath.item]]!
                viewController.loadedMonster = MonsterData
            }
            viewController.delegate = self

        }
    }
    
}

extension MonsterManagerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _Monsters.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item < _Monsters.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Monster")
            cell?.textLabel?.text = MonsterNames[indexPath.item]
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "+")
            return cell!
        }
    }
    
    func saveMonsterToData(monster: Monster) {
        let monsterData = NSEntityDescription.insertNewObject(forEntityName: "Monster", into: context!)
        monsterData.setValue(monster._Name, forKey: "name")
        monsterData.setValue(monster._HP, forKey: "hp")
        monsterData.setValue(monster._AC, forKey: "ac")
        monsterData.setValue(monster._Prof, forKey: "proficiency")
        monsterData.setValue(monster._Str, forKey: "statStr")
        monsterData.setValue(monster._Dex, forKey: "statDex")
        monsterData.setValue(monster._Con, forKey: "statCon")
        monsterData.setValue(monster._Int, forKey: "statInt")
        monsterData.setValue(monster._Wis, forKey: "statWis")
        monsterData.setValue(monster._Chr, forKey: "statChr")
        monsterData.setValue(monster._Saves[0], forKey: "statStr")
        monsterData.setValue(monster._Saves[1], forKey: "statDex")
        monsterData.setValue(monster._Saves[2], forKey: "statCon")
        monsterData.setValue(monster._Saves[3], forKey: "statInt")
        monsterData.setValue(monster._Saves[4], forKey: "statWis")
        monsterData.setValue(monster._Saves[5], forKey: "statChr")
    }
    
    func loadMonstersFromData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
        request.returnsObjectsAsFaults = false
        do
        {
            let results = try context?.fetch(request)
            if (results?.count)! > 0
            {
                for result in results as! [NSManagedObject]
                {
                    let monster = Monster(name: result.value(forKey: "name") as! String, hp: result.value(forKey: "hp") as! Int, ac: result.value(forKey: "ac") as! Int, prof: result.value(forKey: "proficiency") as! Int)
                    monster.Stats(str: result.value(forKey: "statStr") as! Int, dex: result.value(forKey: "statDex") as! Int, con: result.value(forKey: "statCon") as! Int, int: result.value(forKey: "statInt") as! Int, wis: result.value(forKey: "statWis") as! Int, chr: result.value(forKey: "statChr") as! Int)
                    monster.Saves(str: result.value(forKey: "saveStr") as! Bool, dex: result.value(forKey: "saveDex") as! Bool, con: result.value(forKey: "saveCon") as! Bool, int: result.value(forKey: "saveInt") as! Bool, wis: result.value(forKey: "saveWis") as! Bool, chr: result.value(forKey: "saveChr") as! Bool)
                    _Monsters.updateValue(monster, forKey: monster._Name)
                }
            }
        }
        catch
        {
            // error
        }
    }
    
    func deleteAllData(entity: String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context?.fetch(fetchRequest)
            for managedObject in results!
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context?.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
}
