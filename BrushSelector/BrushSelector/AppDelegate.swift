//
//  AppDelegate.swift
//  BrushSelector
//
//  Created by u0844210 on 2/4/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol WidthSliderDelegate: class {
    func widthSlider(widthSlider: AppDelegate, rotatedToAngle angle: Float)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BrushJoinDelegate, BrushCapDelegate, ColorSelectorDelegate {

    var window: UIWindow?
    let gl: CAGradientLayer = CAGradientLayer()
    let widthSlider: UISlider = UISlider()
    var _red: CGFloat = 0.0
    var _green: CGFloat = 0.0
    var _blue: CGFloat = 0.0
    var width: Float = 0.5
    let brushExample: BrushExampleView = BrushExampleView()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        //let brushExample: BrushExampleView = BrushExampleView()
        brushExample.frame = CGRect(x:(window?.frame.width)! / 2 - 150, y: (window?.frame.height)! - 140, width:300, height: 140)
        brushExample.backgroundColor = UIColor.clear
        
        //let title: UIView = UIView(frame: CGRect(x: (window?.frame.width)! / 2 - 125, y: 20.0, width: 250, height: 50))
        let title: UILabel = UILabel(frame: CGRect(x: (window?.frame.width)! / 2 - 125, y: 20.0, width: 250, height: 50))
        title.text = "Brush Selector"
        title.textColor = UIColor.white
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont(name: "AmericanTypewriter", size: 30)
        
        let redColorSelector: RedSelectorView = RedSelectorView()
        redColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 90.0, width: 250, height: 50)
        let redSubView: ColorSelectorView = redColorSelector.subviews[0] as! ColorSelectorView
        redSubView.delegate = self
        
        let greenColorSelector: GreenSelectorView = GreenSelectorView()
        greenColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 160.0, width: 250, height: 50)
        let greenSubView: ColorSelectorView = greenColorSelector.subviews[0] as! ColorSelectorView
        greenSubView.delegate = self
        
        let blueColorSelector: BlueSelectorView = BlueSelectorView()
        blueColorSelector.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: 230.0, width: 250, height: 50)
        let blueSubView: ColorSelectorView = blueColorSelector.subviews[0] as! ColorSelectorView
        blueSubView.delegate = self
        
        let brushCap: BrushCapView = BrushCapView()
        brushCap.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: ((window?.frame.height)! / 2) + 70, width: 250, height: 60)
        brushCap.delegate = self
        
        let brushJoin: BrushJoinView = BrushJoinView()
        brushJoin.frame = CGRect(x: (window?.frame.width)! / 2 - 125, y: ((window?.frame.height)! / 2) + 160, width: 250, height: 60)
        brushJoin.delegate = self
        
        window?.rootViewController?.view.addSubview(title)
        window?.rootViewController?.view.addSubview(redColorSelector)
        window?.rootViewController?.view.addSubview(greenColorSelector)
        window?.rootViewController?.view.addSubview(blueColorSelector)
        window?.rootViewController?.view.addSubview(brushCap)
        window?.rootViewController?.view.addSubview(brushJoin)
        window?.rootViewController?.view.addSubview(brushExample)        
        
        widthSlider.frame = CGRect(x: 40, y: ((window?.frame.height)! / 2) + 20, width: (window?.frame.width)! - 80, height: 30)
        widthSlider.minimumValue = 0.5
        widthSlider.maximumValue = 50.0
        widthSlider.addTarget(self, action: #selector(widthSliderChanged), for: UIControlEvents.valueChanged)
        window?.rootViewController?.view.addSubview(widthSlider)
        
        return true
    }
    
    
    func brushCap(brushCap: BrushCapView, StylePicked style: CGLineCap) {
        brushExample.capStyleChanged(capStyle: style)
    }
    
    func brushJoin(brushJoin: BrushJoinView, StylePicked style: CGLineJoin) {
        brushExample.joinStyleChanged(joinStyle: style)
    }
    
    func widthSliderChanged () {
        brushExample.widthChanged(newWidth: widthSlider.value)
    }
    
    func colorSelector(colorSelector: ColorSelectorView, movedToValue value: CGFloat, asColor color: String) {
        if (color == "red") {
            _red = value
        }
        if (color == "green") {
            _green = value
        }
        if (color == "blue") {
            _blue = value
        }
        let newColor: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [_red,_green,_blue,1.0])!
        //let newColor: CGColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.4,0.3,0.8])!
        brushExample.colorChanged(newColor: newColor)
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

