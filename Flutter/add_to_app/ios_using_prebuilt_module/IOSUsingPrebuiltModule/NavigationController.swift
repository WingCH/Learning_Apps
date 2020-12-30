//
//  NavigationController.swift
//  IOSUsingPrebuiltModule
//
//  Created by WingCH on 29/12/2020.
//

import UIKit
import Flutter

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine,
           let methodChannel = (UIApplication.shared.delegate as? AppDelegate)?.methodChannel{
            flutterEngine.viewController = nil
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            self.setViewControllers([flutterViewController], animated: false)
        }
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
