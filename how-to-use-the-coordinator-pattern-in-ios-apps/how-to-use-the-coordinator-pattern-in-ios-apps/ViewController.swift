//
//  ViewController.swift
//  how-to-use-the-coordinator-pattern-in-ios-apps
//
//  Created by CHAN Hong Wing on 29/9/2020.
//  Copyright © 2020 CHAN Hong Wing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}

