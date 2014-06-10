//
//  AppDelegate.swift
//  Steps
//
//  Created by Paulo Fierro on 09/06/2014.
//  Copyright (c) 2014 jadehopper ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
                            
    @lazy var window: UIWindow = {
        let win                 = UIWindow(frame: UIScreen.mainScreen().bounds)
        win.rootViewController  = UINavigationController(rootViewController: ViewController())
        return win
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool
    {
        window.makeKeyAndVisible()
        return true
    }
}

