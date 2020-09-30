//
//  MainTabBarController.swift
//  how-to-use-the-coordinator-pattern-in-ios-apps
//
//  Created by WingCH on 30/9/2020.
//  Copyright © 2020 CHAN Hong Wing. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.start()
        
        let vc = UIViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        viewControllers = [main.navigationController, vc]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
