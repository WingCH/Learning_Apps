//
//  AppDelegate.swift
//  how-to-use-the-coordinator-pattern-in-ios-apps
//
//  Created by CHAN Hong Wing on 29/9/2020.
//  Copyright © 2020 CHAN Hong Wing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    var coordinator: MainCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let navCoordinator = UINavigationController()
//        coordinator = MainCoordinator(navigationController: navCoordinator)
//        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

