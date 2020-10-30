//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var themeProvider: ThemeProvider?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        themeProvider =  LegacyThemeProvider(window: window!)
        
        if let styleableNavigationController = window!.rootViewController as? StyleableNavigationController {
            styleableNavigationController.themeProvider = themeProvider
            
            if let moviesTableViewController =  styleableNavigationController.visibleViewController as? MoviesTableViewController {
                moviesTableViewController.themeProvider = themeProvider
            }
        }
        
        return true
    }
}
