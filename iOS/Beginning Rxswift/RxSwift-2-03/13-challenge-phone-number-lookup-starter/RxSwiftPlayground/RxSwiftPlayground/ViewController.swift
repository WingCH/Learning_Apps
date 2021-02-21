//
//  ViewController.swift
//  RxSwiftPlayground
//
//  Created by Scott Gardner on 10/15/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    example(of: "Challenge 1") {
      
      let disposeBag = DisposeBag()
      
      let contacts = [
        "603-555-1212": "Florent",
        "212-555-1212": "Junior",
        "408-555-1212": "Marin",
        "617-555-1212": "Scott"
      ]
      
      func phoneNumber(from inputs: [Int]) -> String {
        var phone = inputs.map(String.init).joined()
        
        phone.insert("-", at: phone.index(
          phone.startIndex,
          offsetBy: 3)
        )
        
        phone.insert("-", at: phone.index(
          phone.startIndex,
          offsetBy: 7)
        )
        
        return phone
      }
      
      let input = PublishSubject<Int>()
      
      // Add your code here
      
      input
        .skipWhile { number -> Bool in
          number == 0
        }
        .filter({ number -> Bool in
          number < 10
        })
        .take(10)
        .toArray()
        .subscribe(onNext : { phoneNumberArray in
          let phone = phoneNumber(from: phoneNumberArray)
          
          if let contact = contacts[phone] {
            print("Dialing \(contact) (\(phone))...")
          } else {
            print("Contact not found")
          }
        })
        .disposed(by: disposeBag)
      
      
      input.onNext(0)
      input.onNext(603)
      
      input.onNext(2)
      input.onNext(1)
      
      // Confirm that 7 results in "Contact not found", and then change to 2 and confirm that Junior is found
      input.onNext(2)
      
      "5551212".forEach {
        if let number = (Int("\($0)")) {
          input.onNext(number)
        }
      }
      
      input.onNext(9)
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
  action()
}
