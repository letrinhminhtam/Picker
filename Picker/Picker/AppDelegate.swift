//
//  AppDelegate.swift
//  Picker
//
//  Created by Le Tam on 7/13/16.
//  Copyright © 2016 TamLTM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navi: UINavigationController = UINavigationController(rootViewController: homeVC);
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = navi
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

