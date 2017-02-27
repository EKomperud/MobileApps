//
//  AppDelegate.swift
//  PaintStudio
//
//  Created by u0844210 on 2/17/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIViewController, UIApplicationDelegate, CollectionControllerDelegate, StudioControllerDelegate {

    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.all
    
    let studioController = StudioViewController()
    let collectionController = CollectionViewController()
    let brushController = BrushSelectorViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: CollectionViewController())
        //collectionController.SetupView()
        window?.makeKeyAndVisible()
        
        
        
        //window?.rootViewController?.view.backgroundColor = UIColor.darkGray
        
        
        
        return true
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
    
    // CollectionControllerDelegate
    func PassOffToStudio(painting: Painting) {
        studioController.studioView.paintingView.painting = painting
        navigationController?.pushViewController(studioController, animated: true)
    }
    
    // StudioControllerDelegate
    func PassOffToCollection(deleted: Bool) {
        navigationController?.pushViewController(collectionController, animated: true)
    }
    
    // StudioControllerDelegate
    func Created(studio: StudioView, withCanvas painting: Painting) {
        let index: Int = collectionController.paintingCollection.count
        collectionController.paintingCollection.AddPainting(p: painting)
        collectionController.paintingCollection.collection[index].index = index
        studioController.studioView = studio
        studioController.studioView.index = index
    }
    
    func Painted(studio: StudioView, stroke: Stroke) {
        collectionController.paintingCollection.collection[studio.index].AddStroke(stroke: stroke)
    }
}

