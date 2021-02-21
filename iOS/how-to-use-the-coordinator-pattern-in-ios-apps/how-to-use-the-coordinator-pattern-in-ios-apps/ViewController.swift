//
//  ViewController.swift
//  how-to-use-the-coordinator-pattern-in-ios-apps
//
//  Created by CHAN Hong Wing on 29/9/2020.
//  Copyright © 2020 CHAN Hong Wing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    var buyAction: ((Int)->Void)?
    var createAccountAction: (()-> Void)?
    
    @IBOutlet weak var product: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        buyAction?(product.selectedSegmentIndex)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        createAccountAction?()
    }
}

