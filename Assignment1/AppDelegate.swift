//
//  AppDelegate.swift
//  Assignment1
//
//  Created by u0844210 on 1/9/17.
//  Copyright © 2017 Eric Komperud. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate var _light: UIImageView? = nil
    let xSlider: UISlider = UISlider()
    let ySlider: UISlider = UISlider()
    let xValue: UILabel = UILabel()
    let yValue: UILabel = UILabel()
    let addition: UILabel = UILabel()
    let multiplication: UILabel = UILabel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.rootViewController?.view.backgroundColor = UIColor.lightGray
        window?.makeKeyAndVisible()
        
        //Legacy code from class
        
//        _light = UIImageView()
//        _light?.backgroundColor = UIColor.red
//        _light?.frame = CGRect(x: 100, y: 300, width: 100, height: 150)
//        _light?.image = UIImage(named: "imgres")
//        //window?.rootViewController?.view.addSubview(_light!)
//        
//        let lightSwitch: UISwitch = UISwitch()
//        lightSwitch.frame = CGRect(x: 50, y: 50, width: 50, height: 75)
//        lightSwitch.addTarget(self, action: #selector(lightSwitchChanged), for: UIControlEvents.valueChanged)
//        //window?.rootViewController?.view.addSubview(lightSwitch)
        
        // xSlider
        xSlider.frame = CGRect(x:25, y:100, width:200, height: 50)
        xSlider.center.x = (window?.center.x)!
        xSlider.center.y = (window?.center.y)! - 50
        xSlider.minimumValue = 0
        xSlider.maximumValue = 100
        xSlider.addTarget(self, action: #selector(sliderChanged), for: UIControlEvents.valueChanged)
        window?.rootViewController?.view.addSubview(xSlider)
        
        // ySlider
        ySlider.frame = CGRect(x:25, y:200, width:200, height: 50)
        ySlider.center.x = (window?.center.x)!
        ySlider.center.y = (window?.center.y)!
        ySlider.minimumValue = 0
        ySlider.maximumValue = 100
        ySlider.addTarget(self, action: #selector(sliderChanged), for: UIControlEvents.valueChanged)
        window?.rootViewController?.view.addSubview(ySlider)
        
        // xLabel
        let xLabel: UILabel = UILabel()
        xLabel.frame = CGRect(x:0, y:0, width: 50, height: 50)
        xLabel.center.x = (window?.center.x)! - 115
        xLabel.center.y = (window?.center.y)! - 50
        xLabel.text = "X"
        window?.rootViewController?.view.addSubview(xLabel)

        // yLabel
        let yLabel: UILabel = UILabel()
        yLabel.frame = CGRect(x:0, y:0, width: 50, height: 50)
        yLabel.center.x = (window?.center.x)! - 115
        yLabel.center.y = (window?.center.y)!
        yLabel.text = "Y"
        window?.rootViewController?.view.addSubview(yLabel)
        
        // xValue
        xValue.frame = CGRect(x:0, y:0, width: 100, height: 50)
        xValue.center.x = (window?.center.x)! + 160
        xValue.center.y = (window?.center.y)! - 50
        xValue.text = "0.0"
        window?.rootViewController?.view.addSubview(xValue)
        
        // yValue
        yValue.frame = CGRect(x:0, y:0, width: 100, height: 50)
        yValue.center.x = (window?.center.x)! + 160
        yValue.center.y = (window?.center.y)!
        yValue.text = "0.0"
        window?.rootViewController?.view.addSubview(yValue)
        
        // Addition label
        addition.frame = CGRect(x:0, y:0, width: 300, height: 50)
        addition.center.x = (window?.center.x)!
        addition.center.y = (window?.center.y)! + 50
        addition.text = "0 + 0 = 0"
        addition.textAlignment = .center
        window?.rootViewController?.view.addSubview(addition)
        
        // Multiplication label
        multiplication.frame = CGRect(x:0, y:0, width: 300, height: 50)
        multiplication.center.x = (window?.center.x)!
        multiplication.center.y = (window?.center.y)! + 100
        multiplication.text = "0 * 0 = 0"
        multiplication.textAlignment = .center
        window?.rootViewController?.view.addSubview(multiplication)
        
        return true
    }
    
//    func lightSwitchChanged() {   
//        _light?.image = UIImage(named: "url")
//    }
    
    func sliderChanged() {
        let addValue = xSlider.value + ySlider.value
        let multValue = xSlider.value * ySlider.value
        addition.text = "\(xSlider.value) + \(ySlider.value) = \(addValue)"
        multiplication.text = "\(xSlider.value) * \(ySlider.value) = \(multValue)"
        xValue.text = "\(xSlider.value)"
        yValue.text = "\(ySlider.value)"
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

