//
//  MainCoordinator.swift
//  how-to-use-the-coordinator-pattern-in-ios-apps
//
//  Created by CHAN Hong Wing on 29/9/2020.
//  Copyright © 2020 CHAN Hong Wing. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate, Buying, AccountCreating {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.buyAction = { [weak self] productType in
            self?.buySubscription(to: productType)
        }
        
        vc.createAccountAction = { [weak self] in
            self?.createAccount()
        }
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription(to productType: Int) {
        let vc = BuyCoordinator(navigationController: navigationController)
        vc.selectProduct = productType 
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // 當navigation back 到最盡個時, 代表child 已經唔存在
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard  let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}
