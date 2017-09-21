//
//  AppDelegate.swift
//  TestLottieAnimations
//
//  Created by William Wilson on 9/21/17.
//  Copyright © 2017 LeTote. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()

        return true
    }
}

