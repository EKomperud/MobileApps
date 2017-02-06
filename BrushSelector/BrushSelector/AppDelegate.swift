//
//  AppDelegate.swift
//  BrushSelector
//
//  Created by u0844210 on 2/4/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gl: CAGradientLayer = CAGradientLayer()
    let widthSlider: UISlider = UISlider()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
//        gl.colors = [UIColor.darkGray.cgColor, UIColor.black.cgColor]
//        gl.frame = CGRect(x: 0, y: 20, width: 300, height: 500)
        
        let redColorSelector: RedSelectorView = RedSelectorView()
        redColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 20.0, width: 250, height: 50)
        
        let greenColorSelector: GreenSelectorView = GreenSelectorView()
        greenColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 90.0, width: 250, height: 50)
        
        let blueColorSelector: BlueSelectorView = BlueSelectorView()
        blueColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 160.0, width: 250, height: 50)
        
        let colorSelector: ColorSelectorView = ColorSelectorView()
        colorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 230.0, width: 250, height: 50)
        
        let brushCap: BrushCapView = BrushCapView()
        brushCap.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: ((window?.frame.height)! / 2) + 50, width: 250, height: 60)
        
        let brushJoin: BrushJoinView = BrushJoinView()
        brushJoin.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: ((window?.frame.height)! / 2) + 160, width: 250, height: 60)
        
        window?.rootViewController?.view.addSubview(redColorSelector)
        window?.rootViewController?.view.addSubview(greenColorSelector)
        window?.rootViewController?.view.addSubview(blueColorSelector)
        window?.rootViewController?.view.addSubview(colorSelector)
        window?.rootViewController?.view.addSubview(brushCap)
        window?.rootViewController?.view.addSubview(brushJoin)
        
        //let context = UIGraphicsGetCurrentContext()
        
        widthSlider.frame = CGRect(x: 40, y: (window?.frame.height)! / 2, width: (window?.frame.width)! - 80, height: 30)
        widthSlider.minimumValue = 0.5
        widthSlider.maximumValue = 50.0
        widthSlider.addTarget(self, action: #selector(widthSliderChanged), for: UIControlEvents.valueChanged)
        window?.rootViewController?.view.addSubview(widthSlider)
        
        return true
    }
    
    func widthSliderChanged () {
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

