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
    private var _light: UIImageView? = nil

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.rootViewController?.view.backgroundColor = UIColor.greenColor()
        window?.makeKeyAndVisible()
        
        _light = UIImageView()
        _light?.backgroundColor = UIColor.redColor()
        _light?.frame = CGRect(x: 100, y: 300, width: 100, height: 150)
        _light?.image = UIImage(named: "imgres")
        window?.rootViewController?.view.addSubview(_light!)
        
        let lightSwitch: UISwitch = UISwitch()
        lightSwitch.frame = CGRect(x: 50, y: 50, width: 50, height: 75)
        lightSwitch.addTarget(self, action: #selector(lightSwitchChanged), forControlEvents: UIControlEvents.ValueChanged)
        window?.rootViewController?.view.addSubview(lightSwitch)
        
        print("Welcome to HELL, World!")
        
        return true
    }
    
    func lightSwitchChanged() {
        print("GATES TO HELL HAVE BEEN OPENED")
        
        _light?.image = UIImage(named: "url")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

