//
//  ViewController.swift
//  Dynamic height TableView in a Scroll View
//
//  Created by WingCH on 24/2/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbl_view: UITableView!
    @IBOutlet weak var tbl_height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tbl_view.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.tbl_view.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tbl_view.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newValue = change?[.newKey] {
                    if let newSize = newValue as? CGSize {
                        self.tbl_height.constant = newSize.height
                    }
                }
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell {
            cell.ibl_txt.text = "Test \(indexPath.row)"
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

