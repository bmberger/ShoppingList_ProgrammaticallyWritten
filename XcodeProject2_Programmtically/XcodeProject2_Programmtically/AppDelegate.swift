//
//  AppDelegate.swift
//  XcodeProject2_Programmtically
//
//  Created by Briana Berger on 7/3/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit
// The App Delegate file is your application’s way of communicating with the operating system, and includes several useful methods.

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //you have to set up manually for something to happen after the launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //sets the windows bounds of screen
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //makes the window visible
        window?.makeKeyAndVisible()
        
        let controller = ViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        
        //We set the window’s rootViewController property to the navigationController we created (aka our main view controller is now set). Every app must have a root view controller.
        window?.rootViewController = navigationController
        
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


}

